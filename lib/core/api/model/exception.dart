import 'dart:convert';

import 'package:http/http.dart';

import 'api_response.dart';

class ServerException implements Exception {
  late String? message;
  late int? statusCode;
  late String? internalStatusCode;
  late String? serverMessage;

  ServerException({
    this.message,
    this.statusCode,
    this.serverMessage,
    this.internalStatusCode,
  });

  @override
  String toString() {
    message ??= '';
    statusCode ??= 0;
    serverMessage ??= '';
    internalStatusCode ??= '';
    if (statusCode == 0)
      return '$internalStatusCode $message $serverMessage';
    else
      return '$internalStatusCode $statusCode $message $serverMessage';
  }

  factory ServerException.handleServerException(Response response) {
    ApiResponse responseData = ApiResponse.fromJson(json.decode(response.body));

    print('ServerException : $responseData');

    return ServerException(
      statusCode: response.statusCode,
      message: response.reasonPhrase.toString(),
      serverMessage: responseData.message,
    );
  }
}
