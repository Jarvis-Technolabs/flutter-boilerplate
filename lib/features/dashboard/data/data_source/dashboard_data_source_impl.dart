import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds.dart';
import 'dashboard_data_source.dart';

class DashboardDataSourceImpl extends DashboardDataSource {
  final IRemoteDataSource remoteDataSource;

  DashboardDataSourceImpl({
    required this.remoteDataSource,
  });
}
