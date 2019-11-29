import 'dart:async';

import 'package:flutter_clean_architecture/core/http/http_client.dart';
import 'package:flutter_clean_architecture/features/login/data/datasources/login_source.dart';
import 'package:flutter_clean_architecture/features/login/data/entities/RegistrationRequest.dart';

class LoginSourceIml implements LoginDataSource {
  LoginSourceIml({this.restClient});

  final RestClient restClient;

  @override
  Future<String> callLogin(RegistrationRequest registrationRequest) async {
    final feed = await restClient
        .getClientWithHeaders(getHeaders())
        .callLoginApi(registrationRequest);
    return feed.message;
  }

  Map getHeaders() => <String, String>{
        "deviceid": "", // todo update here
        "devicetoken": "" // todo update here
      };
}
