import 'package:example_app/core/api/data_source/network_info/network_info.dart';
import '../../domain/repositories/accessibility_repo.dart';
import '../data_source/accessibility_data_source.dart';

class AccessibilityRepoImpl extends AccessibilityRepo {
  final AccessibilityDataSource dataSource;
  final NetworkInfo networkInfo;

  AccessibilityRepoImpl(
    this.networkInfo,
    this.dataSource,
  ) : super(networkInfo);
}
