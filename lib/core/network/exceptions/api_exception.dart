final class ApiException implements Exception {
  const ApiException({
    required this.message,
    this.code,
  });

  final String message;
  final int? code;

  @override
  String toString() {
    return 'ApiException(message: $message, code: $code)';
  }
}
