import 'package:flutter/foundation.dart';

@immutable
abstract class AppConfigurationEvent {}

class ThemeChangeEvent extends AppConfigurationEvent {
  final bool isDark;

  ThemeChangeEvent({
    required this.isDark,
  });
}

class LanguageChangeEvent extends AppConfigurationEvent {
  final String languageCode;

  LanguageChangeEvent({
    required this.languageCode,
  });
}
