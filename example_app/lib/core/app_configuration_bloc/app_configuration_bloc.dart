import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:example_app/core/di/injection_container.dart';
import 'package:example_app/core/preference/preference_helper.dart';

import 'app_configuration_event.dart';
import 'app_configuration_state.dart';

class AppConfigurationBloc
    extends Bloc<AppConfigurationEvent, AppConfigurationState> {
  final PreferenceHelper preferenceHelper = sl();

  AppConfigurationBloc() : super(AppConfigurationInitial()) {
    on<ThemeChangeEvent>(_ThemeChangeEvent);
    on<LanguageChangeEvent>(_LanguageChangeEvent);
  }

  Future<void> _ThemeChangeEvent(
      ThemeChangeEvent event, Emitter<AppConfigurationState> emit) async {
    /// set themeType to the sharedPreference
    await preferenceHelper.setIsDarkTheme(event.isDark);
    emit(AppConfigurationFetchedState());
  }

  Future<void> _LanguageChangeEvent(
      LanguageChangeEvent event, Emitter<AppConfigurationState> emit) async {
    /// set languageCode to the sharedPreference
    await preferenceHelper.setLanguage(event.languageCode);
    emit(AppConfigurationFetchedState());
  }
}
