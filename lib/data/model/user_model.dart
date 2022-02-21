import 'package:multiple_listener/domain/entity/user_entity.dart';

class UserModel {
  final String name;
  final String email;

  UserModel(this.name, this.email);

  UserEntity toEntity() => UserEntity(name, email);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}
