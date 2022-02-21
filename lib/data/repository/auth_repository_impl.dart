import 'package:multiple_listener/common/k_exception.dart';
import 'package:multiple_listener/data/datasource/auth_remote_datasource.dart';
import 'package:multiple_listener/domain/entity/user_entity.dart';
import 'package:multiple_listener/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:multiple_listener/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FakeAuthRemoteDataSourceImpl remoteDatasource;

  AuthRepositoryImpl(this.remoteDatasource);
  @override
  Future<Either<Failure, UserEntity>> checkEmail(String email) async {
    try {
      final res = await remoteDatasource.checkEmail(email);
      return right(res.toEntity());
    } on EmailAlreadyUsedException catch (e) {
      return left(EmailAlreadyUsedFailure(e.message));
    } on EmailNotValidException catch (e) {
      return left(EmailNotValidFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> checkPhone(String phone) async {
    try {
      final res = await remoteDatasource.checkPhone(phone);
      return right(res.toEntity());
    } on PhoneAlreadyUsedException catch (e) {
      return left(PhoneAlreadyUsedFailure(e.message));
    } on PhoneNotValidException catch (e) {
      return left(PhoneNotValidFailure(e.message));
    }
  }
}
