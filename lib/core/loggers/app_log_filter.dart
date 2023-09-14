import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/flavour/flavour_config.dart';
import 'package:logger/logger.dart';

class AppLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => FlavourConfig.isDev() || kReleaseMode;
}
