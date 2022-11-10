// ignore_for_file: one_member_abstracts

import 'package:assessment/data/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type?>> call(Params params);
}
