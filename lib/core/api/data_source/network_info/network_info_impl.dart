import 'package:connectivity_plus/connectivity_plus.dart';
import 'network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this.connectivity);

  final Connectivity connectivity;

  @override
  Future<bool> get isConnected async =>
      ((await connectivity.checkConnectivity()) == ConnectivityResult.mobile) ||
      ((await connectivity.checkConnectivity()) == ConnectivityResult.wifi);
}
