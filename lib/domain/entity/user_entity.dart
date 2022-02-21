class UserEntity {
  final String name;
  final String email;
  final String phone;

  UserEntity(
    this.name,
    this.email,
    this.phone,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity &&
        other.name == name &&
        other.email == email &&
        other.phone == phone;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ phone.hashCode;
}
