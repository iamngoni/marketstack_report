import 'package:dio/dio.dart';

import '../models/app_exception.dart';

AppException dioErrorToAppException(DioError error) {
  late AppException exception;
  switch (error.type) {
    case DioErrorType.connectTimeout:
      exception = AppException(
        "Connection timed out, please check your internet 📡",
        title: "Connection Error",
      );
      break;
    case DioErrorType.sendTimeout:
      exception = AppException(
        "Connection timed out, please check your internet 📡",
        title: "Connection Error",
      );
      break;
    case DioErrorType.receiveTimeout:
      exception = AppException(
        "Connection timed out, please check your internet 📡",
        title: "Connection Error",
      );
      break;
    case DioErrorType.response:
      switch (error.response?.statusCode) {
        case 400:
          exception = AppException(
            "Please check the information you supplied",
            title: "Bad Request",
          );
          break;
        case 401:
          exception = AppException(
            "Failed to authenticate request",
            title: "Authentication Error",
          );
          break;
        case 403:
          exception = AppException(
            "Unfortunately you're not authorized to make this request",
            title: "Unauthorized",
          );
          break;
        case 404:
          exception = AppException(
            "The resource was not found",
            title: "Not found",
          );
          break;
        case 500:
          exception = AppException(
            "Failed to process the request",
            title: "System Failure",
          );
          break;
      }
      break;
    case DioErrorType.cancel:
      exception = AppException(
        error.message,
        title: "Connection Cancelled",
      );
      break;
    case DioErrorType.other:
      exception = AppException(
        "Failed to connect to the server, please check your internet 📡",
        title: "Request Error",
      );
      break;
  }

  return exception;
}
