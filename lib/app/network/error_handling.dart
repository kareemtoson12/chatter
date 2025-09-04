import 'package:chatter/app/network/failure_model.dart';
import 'package:dio/dio.dart';

class ErrorHandler {
  static Failure handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return Failure("Connection Timeout");
        case DioExceptionType.receiveTimeout:
          return Failure("Receive Timeout");
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode ?? 0;
          final message = error.response?.data?.toString() ?? "Server Error";
          return Failure(message, status: statusCode);
        case DioExceptionType.cancel:
          return Failure("Request Cancelled");
        case DioExceptionType.unknown:
          return Failure("Network Error");
        default:
          return Failure("Unexpected Error");
      }
    }
    return Failure("Unexpected Error: ${error.toString()}");
  }
}
