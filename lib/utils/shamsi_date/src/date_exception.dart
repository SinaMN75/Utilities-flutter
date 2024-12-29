abstract class DateException implements Exception {
  factory DateException(String message) {
    return _DateExceptionImpl(message);
  }
}

class _DateExceptionImpl implements DateException {
  final String message;

  const _DateExceptionImpl(this.message);

  @override
  String toString() {
    return 'DateException: $message';
  }
}
