import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/preference/preference_helper.dart';

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
    await preferenceHelper.setIsDarkTheme(event.isDark);
    emit(AppConfigurationFetchedState());
  }

  Future<void> _LanguageChangeEvent(
      LanguageChangeEvent event, Emitter<AppConfigurationState> emit) async {
    await preferenceHelper.setLanguage(event.languageCode);
    emit(AppConfigurationFetchedState());
  }
}
