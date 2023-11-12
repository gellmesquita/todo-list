
abstract class BaseResponse<T> {
  final bool? success;
  final T? data;
  final ErrorData? error;

  BaseResponse(this.success, this.data, this.error);
}

class ErrorData {
  final String? message;
  final int? status;
  final String? code;

  ErrorData(this.message, this.status, this.code);
}
