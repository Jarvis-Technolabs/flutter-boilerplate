import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/repository/base_api_repo.dart';

abstract class HomeRepo extends BaseApiRepo {
  HomeRepo(NetworkInfo networkInfo) : super(networkInfo: networkInfo);
}
