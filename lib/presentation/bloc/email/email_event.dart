part of 'email_bloc.dart';

@immutable
abstract class EmailEvent {}

class CheckEmailEvent extends EmailEvent {
  final String email;

  CheckEmailEvent(this.email);
}
