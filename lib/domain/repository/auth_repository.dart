import 'package:dartz/dartz.dart';
import 'package:multiple_listener/common/failure.dart';
import 'package:multiple_listener/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> checkEmail(String email);
  Future<Either<Failure, UserEntity>> checkPhone(String phone);
}
