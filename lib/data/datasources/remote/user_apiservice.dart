import 'package:boilerplate/data/models/user_model.dart';
import 'package:boilerplate/domain/usecases/user_usecases/login_usecase.dart';
import 'package:dio/dio.dart';

abstract class UserApiService {
  factory UserApiService({
    required Dio dio,
  }) =>
      UserApiServiceImpl(dio: dio);

  Future<UserModel> login({
    required LoginUsecaseParams loginUsecaseParams,
  });

  String get loginPath;
}

class UserApiServiceImpl implements UserApiService {
  const UserApiServiceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<UserModel> login({
    required LoginUsecaseParams loginUsecaseParams,
  }) async {
    final response = await dio.post(
      loginPath,
      data: loginUsecaseParams.toJson(),
    );
    return UserModel.fromJson(response.data);
  }

  @override
  String get loginPath {
    return '/users/login/';
  }
}
