//TODO finish setupping
// import 'package:dio/dio.dart';
// import 'package:fimber/fimber.dart';
//
// class DioLoggingInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     Fimber.d("--> ${_formRequest(options, withDetails: true)}");
//     super.onRequest(options, handler);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // Fimber.d("<-- ${_formResponse(response, withDetails: true)}");
//     printWrapped("<-- ${_formResponse(response, withDetails: true)}");
//     super.onResponse(response, handler);
//   }
//
//   void printWrapped(String text) {
//     final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
//     pattern.allMatches(text).forEach((match) => Fimber.d(match.group(0) ?? ""));
//   }
//
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     printWrapped("<-- ${_formErrorResponse(err, withDetails: true)}");
//     // Fimber.w("<-- ${_formErrorResponse(err, withDetails: true)}");
//     super.onError(err, handler);
//   }
//
//   bool isWarning(int errorCode) {
//     return (errorCode > 400 && errorCode < 499);
//   }
//
//   // Convenience methods
//
//   String _formErrorResponse(DioError error, {bool withDetails = false}) {
//     final StringBuffer sb = StringBuffer();
//     sb.write(_extractMethod(error.requestOptions));
//     if (error.response != null) {
//       sb.write(" ");
//       sb.write(error.response!.statusCode);
//     }
//     sb.write(" ");
//     sb.write(error.requestOptions.baseUrl);
//     sb.write(error.requestOptions.path);
//     if (withDetails && error.response != null) {
//       sb.write(" ");
//       sb.write(_formResponseDetails(error.response!, withHeaders: true));
//     } else {
//       sb.write(" ");
//       sb.write(error.message);
//       sb.write("\n");
//       sb.write(error.stackTrace);
//     }
//     return sb.toString();
//   }
//
//   String _formRequest(RequestOptions options, {bool withDetails = false}) {
//     final StringBuffer sb = StringBuffer();
//     sb.write(_extractMethod(options));
//     sb.write(" ");
//     sb.write(options.baseUrl);
//     sb.write(options.path);
//     if (withDetails) {
//       sb.write("\n");
//       sb.write(_formRequestDetails(options, withHeaders: false));
//     }
//     return sb.toString();
//   }
//
//   String _formResponse(Response response, {bool withDetails = false}) {
//     final StringBuffer sb = StringBuffer();
//     sb.write(_extractMethod(response.requestOptions));
//     sb.write(" ");
//     sb.write(response.statusCode);
//     sb.write(" ");
//     sb.write(response.realUri);
//     if (withDetails) {
//       sb.write("\n");
//       sb.write(_formResponseDetails(response, withHeaders: false));
//     }
//     return sb.toString();
//   }
//
//   String _formResponseDetails(Response response, {bool withHeaders = false}) {
//     final StringBuffer sb = StringBuffer();
//     if (withHeaders) {
//       sb.write("${_formResponseHeaders(response)}");
//     }
//     sb.write("${_formResponseBodyOrEmpty(response)}");
//     return sb.toString();
//   }
//
//   String _formRequestDetails(
//       RequestOptions options, {
//         bool withHeaders = false,
//       }) {
//     final StringBuffer sb = StringBuffer();
//     if (withHeaders) {
//       sb.write("${_formRequestHeaders(options)}");
//     }
//     sb.write("${_formRequestQueryParamsOrEmpty(options)}");
//     sb.write("${_formRequestBodyOrEmpty(options)}");
//     return sb.toString();
//   }
//
//   String _formErrorDetails(DioError error, {bool withHeaders = false}) {
//     final StringBuffer sb = StringBuffer();
//     if (withHeaders) {
//       sb.write("${_formRequestHeaders(error.requestOptions)}");
//     }
//     sb.write("${_formResponseBodyOrEmpty(error.response)}");
//     return sb.toString();
//   }
//
//   String _formRequestHeaders(RequestOptions options) {
//     final StringBuffer sb = StringBuffer();
//     sb.write("- Headers:\n");
//     options.headers.forEach((String k, v) => sb.write("-- $k: $v\n"));
//     return sb.toString();
//   }
//
//   String _formResponseHeaders(Response response) {
//     final StringBuffer sb = StringBuffer();
//     sb.write("- Headers:\n");
//     response.headers.map
//         .forEach((String k, List<String> v) => sb.write("-- $k: $v\n"));
//     return sb.toString();
//   }
//
//   String _formRequestQueryParamsOrEmpty(RequestOptions options) {
//     if (options.queryParameters.isEmpty) {
//       return "";
//     }
//     final StringBuffer sb = StringBuffer(
//         "- Query params: ${options.queryParameters.entries.toList()}");
//     options.queryParameters.forEach((String k, v) => sb.write("-- $k: $v\n"));
//     return sb.toString();
//   }
//
//   String _formRequestBodyOrEmpty(RequestOptions options) {
//     if (options.data == null) {
//       return "";
//     }
//     final StringBuffer sb = StringBuffer("- Body: ");
//     sb.write(options.data);
//     return sb.toString();
//   }
//
//   String _formResponseBodyOrEmpty(Response? response) {
//     if (response == null || response.data == null) {
//       return "";
//     }
//     final StringBuffer sb = StringBuffer("- Body: ");
//     sb.write(response.data);
//     return sb.toString();
//   }
//
//   String _extractMethod(RequestOptions options) {
//     return options.method.toUpperCase();
//   }
// }
