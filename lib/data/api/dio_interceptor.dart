import 'package:dio/dio.dart';
import 'package:flutter_skeleton_2023/data/api/error_handler.dart';

class DioInterceptor extends InterceptorsWrapper {
  final Dio dio;
  final ErrorHandler errorHandler;

  DioInterceptor({
    required this.dio,
    required this.errorHandler,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept"] = "application/json";
    options.headers["Content-Type"] = "application/json";
    super.onRequest(options, handler);
  }
}
