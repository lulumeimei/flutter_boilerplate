import 'dart:io';

import 'package:boilerplate/data/datasources/remote/user_apiservice.dart';
import 'package:boilerplate/data/failure.dart';
import 'package:boilerplate/domain/entities/user.dart';
import 'package:boilerplate/domain/usecases/user_usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class UserRepository {
  factory UserRepository({
    required UserApiService userApiService,
  }) =>
      UserRepositoryImpl(userApiService: userApiService);

  Future<Either<Failure, User>> login({
    required LoginUsecaseParams loginUsecaseParams,
  });
}

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({
    required this.userApiService,
  });
  final UserApiService userApiService;

  @override
  Future<Either<Failure, User>> login({
    required LoginUsecaseParams loginUsecaseParams,
  }) async {
    try {
      final result = await userApiService.login(
        loginUsecaseParams: loginUsecaseParams,
      );
      return Right(result.toEntity());
    } catch (e) {
      if (e is DioError) {
        // TODO: make a failure helper
        switch (e.type) {
          case DioErrorType.cancel:
            return const Left(
                ServerFailure('Request to API server was cancelled'));
          case DioErrorType.connectTimeout:
            return const Left(
                ServerFailure('Connection timeout with API server'));
          case DioErrorType.other:
            return const Left(
              ServerFailure(
                'Connection to API server failed due to internet connection',
              ),
            );
          case DioErrorType.receiveTimeout:
            return const Left(
              ServerFailure('Receive timeout in connection with API server'),
            );
          case DioErrorType.response:
            return Left(
              ServerFailure(
                'Received invalid status code: ${e.response?.statusCode}',
              ),
            );
          case DioErrorType.sendTimeout:
            return const Left(
              ServerFailure('Send timeout in connection with API server'),
            );
        }
      } else if (e is SocketException) {
        return const Left(
          ConnectionFailure(
            'Failed to connect to the network',
          ),
        );
      }
      return const Left(ServerFailure('Something went wrong'));
    }
  }
}
