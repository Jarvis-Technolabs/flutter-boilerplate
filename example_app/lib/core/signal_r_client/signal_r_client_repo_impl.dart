import 'dart:convert';

import 'package:example_app/core/const/api_constants.dart';
import 'package:example_app/core/di/injection_container.dart';
import 'package:example_app/core/flavour/flavour_config.dart';
import 'package:example_app/core/preference/preference_helper.dart';
import 'package:example_app/core/signal_r_client/signal_r_client_repo.dart';
import 'package:logging/logging.dart';
import 'package:signalr_netcore/signalr_client.dart';

class SignalRClientRepoImpl implements SignalRClientRepo {
  HubConnection? hubConnection;
  PreferenceHelper preferenceHelper = sl();
  Logger log = sl();

  @override
  Future<HubConnection?> connect() async {
    try {
      hubConnection = HubConnectionBuilder()
          .withUrl(
            FlavourConfig.instance!.WEB_SOCKET_URL,
            options: HttpConnectionOptions(
              requestTimeout: SIGNAL_R_SOCKET_CONNECT_TIMEOUT,
              accessTokenFactory: () async => getUserToken(),
            ),
          )
          .withAutomaticReconnect()
          .configureLogging(log)
          .build();
    } catch (e) {}
    return hubConnection;
  }

  Future<String> getUserToken() async {
    String? userToken = await preferenceHelper.getUserToken();
    return userToken!;
  }

  @override
  Future<void> disconnect() async {
    if (hubConnection != null) {
      await hubConnection!.stop();
    }
  }

  Future<Map<String, dynamic>> getHeader() async {
    Map<String, dynamic> header = {};

    String? publicToken;
    String? userToken = await preferenceHelper.getUserToken();
    if (userToken == null) {
      publicToken = await preferenceHelper.getPublicToken();
    }
    header.putIfAbsent(
      CONTENT_TYPE,
      () => APPLICATION_JSON_CONTENT_TYPE,
    );
    header.putIfAbsent(
      X_API_KEY,
      () => utf8.decode(FlavourConfig.instance!.X_API_KEY),
    );
    header.putIfAbsent(
      X_SESSION_TOKEN,
      () => userToken ?? publicToken ?? "",
    );
    return header;
  }
}
