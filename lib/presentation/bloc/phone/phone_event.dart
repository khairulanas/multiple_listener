part of 'phone_bloc.dart';

@immutable
abstract class PhoneEvent {}

class CheckPhoneEvent extends PhoneEvent {
  final String email;

  CheckPhoneEvent(this.email);
}
