
import 'package:flutter_clean_architecture/core/util/FlavorConfig.dart';
import 'package:logger/logger.dart';

class AppLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (FlavorConfig.isDev()) {
      return true;
    } else {
      return false;
    }
  }
}
