import 'package:assessment/core/usecase.dart';
import 'package:assessment/data/failure.dart';
import 'package:assessment/domain/entities/user.dart';
import 'package:assessment/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase implements UseCase<User, LoginUsecaseParams> {
  const LoginUsecase(
    this.userRepository,
  );

  final UserRepository userRepository;

  @override
  Future<Either<Failure, User>> call(
    LoginUsecaseParams params,
  ) async {
    return userRepository.login(
      loginUsecaseParams: params,
    );
  }
}

class LoginUsecaseParams {
  const LoginUsecaseParams({
    required this.email,
    required this.password,
  });
  static const _email = 'email';
  static const _password = 'password';
  final String email;
  final String password;

  Map<String, dynamic> toJson() {
    return {
      _email: email,
      _password: password,
    };
  }
}
