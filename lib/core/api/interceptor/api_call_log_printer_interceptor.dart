import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../di/injection_container.dart';
import '../../util/utilities.dart';

class ApiCallLogPrinterInterceptors extends InterceptorsWrapper {
  Logger logger = sl();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    Utilities.printFullLog(
        "\n\nAPI: ${options.path} => HEADER[${jsonEncode(options.headers)}] => REQUEST_BODY[${options.method}]: ${jsonEncode(options.data)}\n\n");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    Utilities.printFullLog(
        "\n\nAPI: ${response.requestOptions.path} => RESPONSE[${response.statusCode}] => RESPONSE_BODY: ${response}\n\n");
    return super.onResponse(response, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    Utilities.printFullLog(
        "ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    return super.onError(err, handler);
  }
}
