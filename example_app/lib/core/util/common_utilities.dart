import 'dart:async';
import 'dart:io';

import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:example_app/core/di/injection_container.dart';
import 'package:example_app/core/localizations/app_localizations.dart';
import 'package:example_app/core/localizations/localization_extension.dart';
import 'package:example_app/core/preference/preference_helper.dart';
import 'package:example_app/core/routes/routes.dart';
import 'package:example_app/core/ui/widgets/custom_alert.dart';
import 'package:example_app/core/ui/widgets/show_app_dialog.dart';
import 'package:example_app/core/util/screen_util/screen_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utility/flutter_custom_utility.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../const/app_constants.dart';
import '../const/string_constants.dart';
import '../firebase_notification_data_source/firebase_notification_data_source.dart';
import '../ui/theme/colors/colors_inf.dart';

Logger? logger = sl();
StreamSubscription? deepLinkStreamSubscription = null;

class CommonUtilities extends Utilities {
  ///SuperTooltip
  SuperTooltip toolTip(
      ColorsInf appColors,
      Widget child, {
        TooltipDirection toolTipDirection = TooltipDirection.up,
      }) =>
      SuperTooltip(
        style: TooltipStyle(
          borderRadius: 4,
          borderColor: appColors.transparentColor,
          backgroundColor: appColors.fabBgColor,
          hasShadow: false,
        ),
        arrowConfig: const ArrowConfiguration(
          length: 4,
          baseWidth: 8,
          tipDistance: 12.0,
        ),
        positionConfig: PositionConfiguration(
          preferredDirection: toolTipDirection,
        ),
        content: Material(
          color: appColors.transparentColor,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: SingleChildScrollView(child: child),
          ),
        ),
      );

  ///Clear data for logout and session expire
  Future<void> clearData() async {
    FirebaseNotificationDataSource fireBaseDataSource = sl();
    await fireBaseDataSource.unSubscribe();
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
    PreferenceHelper preferenceHelper = sl();
    String? username = await preferenceHelper.getUserName();
    String? password = await preferenceHelper.getPassword();
    String language = await preferenceHelper.getLanguage();
    bool isDarkTheme = await preferenceHelper.getIsDarkTheme();

    ///Clear all preference data
    await preferenceHelper.clearAllPrefData();
    if (username != null) {
      await preferenceHelper.setUserName(username);
    }
    if (password != null) {
      await preferenceHelper.setPassword(password);
    }

    ///Set language
    await preferenceHelper.setLanguage(language);

    ///Set isDarkTheme flag
    await preferenceHelper.setIsDarkTheme(isDarkTheme);
    HiveCacheStore hiveCacheStore = sl();
    await hiveCacheStore.clean();
  }

  ///Clear data for account delete and password change
  Future<void> clearAllData() async {
    FirebaseNotificationDataSource fireBaseDataSource = sl();
    await fireBaseDataSource.unSubscribe();
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
    PreferenceHelper preferenceHelper = sl();
    await preferenceHelper.clearAllPrefData();
    HiveCacheStore hiveCacheStore = sl();
    await hiveCacheStore.clean();
  }

  ///Print Full Log
  void printFullLog(String text) {
    Logger logger = sl();
    int length = text.length;
    for (int i = 0; i < length; i += 1024) {
      if (i + 1024 < length) {
        logger.log(Level.verbose, text.substring(i, i + 1024));
      } else {
        logger.log(Level.verbose, text.substring(i, length));
      }
    }
  }

  /// Force update dialog
  Future<dynamic> showAppUpdateDialog(
      {required BuildContext context, required ScreenUtil screenUtil, required ColorsInf appColors}) => showAppDialog(
    context: context,
    screenUtil: screenUtil,
    appColors: appColors,
    barrierDismissible: false,
    child: CustomAlert(
      titleText: context.tr(LABEL_UPDATE),
      descriptionText: getAppUpdateErrorMessage(context),
      buttonText: context.tr(LABEL_UPDATE),
      onClick: () {
        PackageInfo.fromPlatform().then(
              (PackageInfo packageInfo) {
            StoreRedirect.redirect(
              androidAppId: PLAY_STORE_ID,
              iOSAppId: APP_STORE_ID,
            );
          },
        );
        closeApp();
      },
    ),
  );

  String getAppUpdateErrorMessage(BuildContext context) {
    if (Platform.isAndroid) {
      return context.tr(LABEL_PLAY_STORE_UPDATE);
    } else if (Platform.isIOS) {
      return context.tr(LABEL_APP_STORE_UPDATE);
    } else {
      return "";
    }
  }
}
