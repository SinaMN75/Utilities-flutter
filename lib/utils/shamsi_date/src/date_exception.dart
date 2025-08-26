abstract class DateException implements Exception {
  factory DateException(String message) => _DateExceptionImpl(message);
}

class _DateExceptionImpl implements DateException {
  const _DateExceptionImpl(this.message);

  final String message;

  @override
  String toString() => 'DateException: $message';
}
