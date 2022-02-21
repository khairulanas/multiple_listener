class EmailAlreadyUsedException implements Exception {
  final String message;
  EmailAlreadyUsedException(this.message);
}

class EmailNotValidException implements Exception {
  final String message;
  EmailNotValidException(this.message);
}

class PhoneAlreadyUsedException implements Exception {
  final String message;
  PhoneAlreadyUsedException(this.message);
}

class PhoneNotValidException implements Exception {
  final String message;
  PhoneNotValidException(this.message);
}
