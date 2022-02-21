abstract class Failure {
  final String message;

  Failure(this.message);
}

class EmailAlreadyUsedFailure extends Failure {
  EmailAlreadyUsedFailure(String message) : super(message);
}

class EmailNotValidFailure extends Failure {
  EmailNotValidFailure(String message) : super(message);
}

class PhoneAlreadyUsedFailure extends Failure {
  PhoneAlreadyUsedFailure(String message) : super(message);
}

class PhoneNotValidFailure extends Failure {
  PhoneNotValidFailure(String message) : super(message);
}
