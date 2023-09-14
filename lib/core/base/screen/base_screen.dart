import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/localizations/app_localizations.dart';
import 'package:flutter_clean_architecture/core/ui/theme/colors/colors_dark.dart';
import 'package:flutter_clean_architecture/core/util/utilities.dart';
import 'package:logger/logger.dart';

import '../../app_configuration_bloc/app_configuration_bloc.dart';
import '../../app_configuration_bloc/app_configuration_state.dart';
import '../../const/string_constants.dart';
import '../../di/injection_container.dart';
import '../../preference/preference_helper.dart';
import '../../ui/theme/colors/colors_inf.dart';
import '../../ui/theme/colors/colors_light.dart';
import '../../util/screen_util/init_screen_util.dart';
import '../../util/screen_util/screen_util.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);
}

abstract class BaseScreenState<T extends BaseScreen> extends State<T>
    with WidgetsBindingObserver {
  late ScreenUtil screenUtil;
  late ColorsInf appColors;
  Logger? logger = sl();
  PreferenceHelper preferenceHelper = sl();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    WidgetsBinding.instance.addObserver(this);
    setAppColors();
  }

  @override
  void didChangeDependencies() {
    setScreenUtil();
    super.didChangeDependencies();
  }

  @override
  Widget build(_) => BlocBuilder<AppConfigurationBloc, AppConfigurationState>(
        builder: (_, AppConfigurationState state) {
          if (state is AppConfigurationFetchedState) {
            setAppColors();
          }
          return body(context);
        },
      );

  Widget body(BuildContext context);

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void setScreenUtil() {
    screenUtil = getScreenUtilInstance(context);
  }

  void setAppColors() {
    appColors =
        preferenceHelper.getIsDarkTheme() ? ColorsDark() : ColorsLight();
  }

  void removeFocus() => FocusScope.of(context).requestFocus(FocusNode());

  void comingSoon() => Utilities.showToast(
        message: AppLocalizations.of(context).translate(LABEL_COMING_SOON),
        appColors: appColors,
      );

  void darkStatusBarTheme() {
    if (preferenceHelper.getIsDarkTheme()) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: appColors.transparentColor,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: appColors.transparentColor,
        ),
      );
    }
  }

  void lightStatusBarTheme() {
    if (!preferenceHelper.getIsDarkTheme()) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: appColors.transparentColor,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: appColors.transparentColor,
        ),
      );
    }
  }
}
