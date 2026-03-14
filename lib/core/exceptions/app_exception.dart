class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  const AppException({
    required this.message,
    this.code,
    this.details,
  });

  @override
  String toString() {
    return "AppException: $message ${code != null ? ' (Code: $code)' : ''}";
  }
}
