import 'package:example_app/core/api/data_source/network_info/network_info.dart';
import 'package:example_app/core/api/repository/base_api_repo.dart';

abstract class AccessibilityRepo extends BaseApiRepo {
  AccessibilityRepo(NetworkInfo networkInfo) : super(networkInfo: networkInfo);
}
