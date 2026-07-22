import 'package:signalr_netcore/signalr_client.dart';

abstract class SignalRClientRepo {
  Future<HubConnection?> connect();

  Future<void> disconnect();
}
