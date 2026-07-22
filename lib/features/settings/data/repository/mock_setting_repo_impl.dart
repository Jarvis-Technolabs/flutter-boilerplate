import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';

import '../../domain/repositories/setting_repo.dart';
import '../data_source/setting_data_source.dart';

class MockSettingRepoImpl extends SettingRepo {
  final SettingDataSource dataSource;
  final NetworkInfo networkInfo;

  MockSettingRepoImpl(
    this.dataSource,
    this.networkInfo,
  ) : super(networkInfo);
}
