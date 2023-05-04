library date_exception;

abstract class DateException implements Exception {
  factory DateException(String message) {
    return _DateExceptionImpl(message);
  }
}

class _DateExceptionImpl implements DateException {
  final String message;

  _DateExceptionImpl(this.message) {
    ArgumentError.checkNotNull(message, 'message');
  }

  @override
  String toString() {
    return 'DateException: $message';
  }
}
