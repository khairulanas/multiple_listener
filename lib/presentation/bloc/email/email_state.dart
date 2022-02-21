part of 'email_bloc.dart';

@immutable
abstract class EmailState {}

class EmailInitial extends EmailState {}

class EmailLoading extends EmailState {}

class EmailLoaded extends EmailState {
  final UserEntity user;

  EmailLoaded(this.user);
}

class EmailError extends EmailState {
  final String message;

  EmailError(this.message);
}
