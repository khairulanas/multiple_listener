part of 'phone_bloc.dart';

@immutable
abstract class PhoneState {}

class PhoneInitial extends PhoneState {}

class PhoneLoading extends PhoneState {}

class PhoneLoaded extends PhoneState {
  final UserEntity user;

  PhoneLoaded(this.user);
}

class PhoneError extends PhoneState {
  final String message;

  PhoneError(this.message);
}
