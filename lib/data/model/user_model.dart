import 'package:multiple_listener/domain/entity/user_entity.dart';

class UserModel {
  final String name;
  final String email;
  final String phone;

  UserModel(
    this.name,
    this.email,
    this.phone,
  );

  UserEntity toEntity() => UserEntity(name, email, phone);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.email == email &&
        other.phone == phone;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ phone.hashCode;
}
