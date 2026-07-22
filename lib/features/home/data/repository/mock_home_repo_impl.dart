import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';

import '../../domain/repositories/home_repo.dart';
import '../data_source/home_data_source.dart';

class MockHomeRepoImpl extends HomeRepo {
  final HomeDataSource dataSource;
  final NetworkInfo networkInfo;

  MockHomeRepoImpl(
    this.dataSource,
    this.networkInfo,
  ) : super(networkInfo);
}
