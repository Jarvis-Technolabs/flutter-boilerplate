import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds.dart';
import 'setting_data_source.dart';

class SettingDataSourceImpl extends SettingDataSource {
  final IRemoteDataSource remoteDataSource;

  SettingDataSourceImpl({
    required this.remoteDataSource,
  });
}
