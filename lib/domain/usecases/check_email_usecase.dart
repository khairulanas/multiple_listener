import 'package:dartz/dartz.dart';
import 'package:multiple_listener/common/failure.dart';
import 'package:multiple_listener/domain/entity/user_entity.dart';
import 'package:multiple_listener/domain/repository/auth_repository.dart';

class CheckEmailUsecase {
  final AuthRepository repository;

  CheckEmailUsecase(this.repository);

  Future<Either<Failure, UserEntity>> execute(String email) async {
    return repository.checkEmail(email);
  }
}
