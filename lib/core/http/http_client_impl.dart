import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/http/HttpHelper.dart';
import 'package:flutter_clean_architecture/core/http/http_client.dart';

class RestClientImpl implements RestClient {
  RestClientImpl({@required this.dioClient});

  final Dio dioClient;

  @override
  RestHelper getClientWithHeaders(Map<String, String> headers) {
    dioClient.options.headers = headers;
    return RestHelper(dioClient);
  }

  @override
  RestHelper getClientWithoutHeaders() => RestHelper(dioClient);
}
