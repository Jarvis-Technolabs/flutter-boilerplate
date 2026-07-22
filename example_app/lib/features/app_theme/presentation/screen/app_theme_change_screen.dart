import 'dart:async';

import 'package:example_app/core/app_configuration_bloc/app_configuration_bloc.dart';
import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_configuration_bloc/app_configuration_event.dart';
import '../../../../core/const/string_constants.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/localizations/localization_extension.dart';
import '../../../../core/preference/preference_helper.dart';
import '../../../../core/ui/widgets/custom_cupertino_switch_widget.dart';

class AppThemeChangeScreen extends BaseBlocWidget {
  @override
  State<AppThemeChangeScreen> createState() => _AppThemeChangeScreenState();
}

class _AppThemeChangeScreenState
    extends BaseBlocWidgetState<AppThemeChangeScreen> {
  StreamController<bool> changeThemeStreamController =
      StreamController.broadcast();
  PreferenceHelper preferenceHelper = sl();

  @override
  Widget getCustomBloc() => Scaffold(
      backgroundColor: appColors.screenBgColor,
      appBar: AppBar(
        title: context.tr(LABEL_CHANGE_APP_THEME)
            .getWhiteColor17W500Inter(
                screenUtil: screenUtil, appColors: appColors),
      ),
      body: StreamBuilder<bool>(
          stream: changeThemeStreamController.stream,
          initialData: preferenceHelper.getIsDarkTheme(),
          builder: (context, snapshot) {
            bool isDarkTheme = snapshot.data ?? false;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                context.tr(LABEL_DARK_MODE)
                    .getTextColor17W500Inter(
                        screenUtil: screenUtil, appColors: appColors)
                    .paddingOnly(screenUtil),
                CustomCupertinoSwitchWidget(
                  transformScale: 0.7,
                  onSwitchValueChange: (bool value) {
                    /// call AppConfigurationBloc's ThemeChangeEvent
                    BlocProvider.of<AppConfigurationBloc>(context)
                        .add(ThemeChangeEvent(isDark: value));
                    changeThemeStreamController.add(value);
                  },
                  activeColor: appColors.primaryColor,
                  trackColor: appColors.secondaryColor,
                  switchValue: isDarkTheme,
                )
              ],
            ).paddingOnly(screenUtil, paddingBottom: 20);
          }).paddingAll(padding: 20, screenUtil: screenUtil));
}
