import 'package:example_app/core/api/data_source/remote_ds/remote_ds.dart';
import 'accessibility_data_source.dart';

class AccessibilityDataSourceImpl extends AccessibilityDataSource {
  final IRemoteDataSource remoteDataSource;

  AccessibilityDataSourceImpl({
    required this.remoteDataSource,
  });
}
