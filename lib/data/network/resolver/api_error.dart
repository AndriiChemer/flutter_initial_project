sealed class ApiError extends Error {
  ApiError(this.statusCode);

  factory ApiError.simple(
    int statusCode, {
    required int status,
    int? triesLeft,
    int? appStatus,
    String? message,
    List<String>? invalidFields,
  }) = ApiErrorSimple;

  final int statusCode;
}

class ApiErrorSimple extends ApiError {
  ApiErrorSimple(
    super.statusCode, {
    required this.status,
    this.triesLeft,
    this.appStatus,
    this.message,
    this.invalidFields,
  });

  final int status;
  final int? triesLeft;
  final int? appStatus;
  final String? message;
  final List<String>? invalidFields;

  @override
  String toString() {
    return 'ApiErrorSimple(statusCode: $statusCode, status: $status, appStatus: $appStatus, message: $message, invalidFields: $invalidFields)';
  }
}

class ApiErrorUnexpected extends ApiError {
  ApiErrorUnexpected(super.statusCode);

  @override
  String toString() {
    return 'ApiErrorUnexpected(statusCode: $statusCode)';
  }
}
