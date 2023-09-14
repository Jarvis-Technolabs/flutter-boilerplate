import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/const/app_constants.dart';
import 'package:flutter_clean_architecture/core/loggers/log_to_file.dart';
import 'package:logger/logger.dart';

import '../preference/preference_helper.dart';

class AppLogPrinter extends LogPrinter {
  final PreferenceHelper? preferenceHelper;
  final LoggerFileUtil loggerFileUtil;

  AppLogPrinter({
    this.preferenceHelper,
    required this.loggerFileUtil,
  });

  @override
  List<String> log(LogEvent event) {
    if (kReleaseMode) {
      FirebaseCrashlytics.instance.log(event.message);
    }
    if (ENABLE_STORING_LOGS_TO_FILE) {
      loggerFileUtil.saveLogs(event.message);
    }
    return [event.message];
  }
}
