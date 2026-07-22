import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this.connectivity);

  final Connectivity connectivity;

  @override
  Future<bool> get isConnected async {
    final List<ConnectivityResult> connectivityResults =
    await connectivity.checkConnectivity();
    return connectivityResults.any(
          (result) => result != ConnectivityResult.none,
    );
  }
}
