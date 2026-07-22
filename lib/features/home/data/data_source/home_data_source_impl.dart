import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds.dart';
import 'home_data_source.dart';

class HomeDataSourceImpl extends HomeDataSource {
  final IRemoteDataSource remoteDataSource;

  HomeDataSourceImpl({
    required this.remoteDataSource,
  });
}
