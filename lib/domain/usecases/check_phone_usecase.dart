import 'package:dartz/dartz.dart';
import 'package:multiple_listener/common/failure.dart';
import 'package:multiple_listener/domain/entity/user_entity.dart';
import 'package:multiple_listener/domain/repository/auth_repository.dart';

class CheckPhoneUsecase {
  final AuthRepository repository;

  CheckPhoneUsecase(this.repository);

  Future<Either<Failure, UserEntity>> execute(String phone) async {
    return repository.checkPhone(phone);
  }
}
