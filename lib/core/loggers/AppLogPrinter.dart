
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_clean_architecture/core/util/FlavorConfig.dart';
import 'package:logger/logger.dart';

class AppLogPrinter extends LogPrinter {
  @override
  void log(LogEvent event) {
    if (FlavorConfig.isDev()) {
      print(event.message);
    } else {
      Crashlytics.instance.log(event.message);
    }
  }
}
