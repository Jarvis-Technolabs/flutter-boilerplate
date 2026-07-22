import 'package:flutter/material.dart';

import 'app_localizations.dart';

extension LocalizationExtension on BuildContext {
  String tr(String key) {
    return AppLocalizations.of(this).translate(key);
  }
}
