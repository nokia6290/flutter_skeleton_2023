import 'package:dio/dio.dart';
import 'package:flutter_skeleton_2023/data/api/app_error.dart';

class ErrorHandler {
  AppError convertDioError(dynamic dioError) {
    if (dioError is DioError) {
      switch (dioError.type) {
        case DioErrorType.cancel:
          return AppError("error_default_title", "error_request_canceled");

        case DioErrorType.connectTimeout:
          return AppError("error_default_title", "error_connection_timeout");

        case DioErrorType.receiveTimeout:
          return AppError("error_default_title", "error_response_timeout");

        // case DioErrorType.response:
        //   if (dioError.response != null) {
        //     final error = dioError.response!.data is String
        //         ? dart_convert.jsonDecode(dioError.response!.data)
        //         : dioError.response!.data;
        //     if (error is List) {
        //       return _deserialize(error.first);
        //     } else {
        //       return _deserialize(error);
        //     }
        //   } else {
        //     return onUnknownError();
        //   }
        case DioErrorType.sendTimeout:
          return AppError("error_default_title", "error_request_timeout");

        default:
          return onUnknownError();
      }
    } else {
      return onUnknownError();
    }
  }

  AppError onUnknownError() {
    return AppError("error_default_title", "error_unknown_description");
  }
}
