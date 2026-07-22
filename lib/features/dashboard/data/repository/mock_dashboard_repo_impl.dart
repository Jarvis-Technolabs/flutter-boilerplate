import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';

import '../../domain/repositories/dashboard_repo.dart';
import '../data_source/dashboard_data_source.dart';

class MockDashboardRepoImpl extends DashboardRepo {
  final DashboardDataSource dataSource;
  final NetworkInfo networkInfo;

  MockDashboardRepoImpl(
    this.dataSource,
    this.networkInfo,
  ) : super(networkInfo);
}
