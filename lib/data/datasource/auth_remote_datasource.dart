import 'dart:math';

import 'package:multiple_listener/data/model/user_model.dart';

import '../../common/k_exception.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> checkEmail(String email);
  Future<UserModel> checkPhone(String phone);
}

class FakeAuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> checkEmail(String email) async {
    ///simulate error or success by random number
    await Future.delayed(const Duration(seconds: 3));
    int random = Random().nextInt(10);
    if (random % 2 == 0) {
      return UserModel('sukses email', email, '');
    } else {
      if (random > 5) {
        throw EmailAlreadyUsedException('email already used');
      } else {
        throw EmailNotValidException('email not valid');
      }
    }
  }

  @override
  Future<UserModel> checkPhone(String phone) async {
    ///simulate error or success by random number
    await Future.delayed(const Duration(seconds: 3));
    int random = Random().nextInt(10);
    if (random % 2 == 0) {
      return UserModel('sukses phone', '', phone);
    } else {
      if (random > 5) {
        throw PhoneAlreadyUsedException('phone already used');
      } else {
        throw PhoneNotValidException('phone not valid');
      }
    }
  }
}
