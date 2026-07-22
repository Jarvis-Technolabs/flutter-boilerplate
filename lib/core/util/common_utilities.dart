import 'dart:developer';
import 'dart:io';

import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/const/app_constants.dart';
import 'package:flutter_clean_architecture/core/const/string_constants.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/localizations/app_localizations.dart';
import 'package:flutter_clean_architecture/core/localizations/localization_extension.dart';
import 'package:flutter_clean_architecture/core/localizations/localization_extension.dart';
import 'package:flutter_clean_architecture/core/localizations/localization_extension.dart';
import 'package:flutter_clean_architecture/core/localizations/localization_extension.dart';
import 'package:flutter_clean_architecture/core/preference/preference_helper.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/custom_alert.dart';
import 'package:flutter_custom_utility/flutter_custom_utility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../firebase_notification_data_source/firebase_notification_data_source.dart';
import '../routes/routes.dart';
import '../ui/theme/colors/colors_inf.dart';
import '../ui/widgets/show_app_dialog.dart';

Logger? logger = sl();

class CommonUtilities extends Utilities {
  static const String _analyticsParamUserId = 'user_id';
  static const String _analyticsParamUserType = 'user_type';

  FirebaseAnalytics? get _analytics =>
      Firebase.apps.isNotEmpty ? FirebaseAnalytics.instance : null;

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
          backgroundColor: appColors.boxBackgroundColor,
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
    String? mobileNo = await preferenceHelper.getMobileNo();
    String language = await preferenceHelper.getLanguage();
    bool isDarkTheme = await preferenceHelper.getIsDarkTheme();

    ///Clear all preference data
    await preferenceHelper.clearAllPrefData();
    if (mobileNo != null) {
      await preferenceHelper.setMobileNo(mobileNo);
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
    if (kDebugMode) {
      log(text);
    } else {
      if (ENABLE_STORING_LOGS_TO_FILE) {
        Logger logger = sl();
        logger.v(text);
      }
    }
  }

  /// Track user-focused analytics events like login/logout with extensible params.
  Future<void> trackUserEngagementEvent({
    required String eventName,
    dynamic userId,
    String? userType,
    Map<String, dynamic>? additionalParameters,
  }) async {
    final FirebaseAnalytics? analytics = _analytics;
    if (analytics == null) return;

    final String normalizedEventName = eventName.trim();
    if (normalizedEventName.isEmpty) return;

    final String? normalizedUserId = _normalizeAnalyticsValue(userId);
    final String? normalizedUserType = _normalizeAnalyticsValue(userType);
    final Map<String, Object> parameters = <String, Object>{
      if (normalizedUserId != null) _analyticsParamUserId: normalizedUserId,
      if (normalizedUserType != null)
        _analyticsParamUserType: normalizedUserType,
    };

    additionalParameters?.forEach((key, value) {
      final String normalizedKey = key.trim();
      final Object? normalizedValue = _normalizeAnalyticsObject(value);
      if (normalizedKey.isEmpty || normalizedValue == null) return;
      parameters[normalizedKey] = normalizedValue;
    });

    if (kDebugMode) {
      debugPrint(
        'Analytics event => name: $normalizedEventName, parameters: $parameters',
      );
    }

    await analytics.logEvent(
      name: normalizedEventName,
      parameters: parameters.isEmpty ? null : parameters,
    );

    final List<Future<void>> analyticsUpdates = <Future<void>>[];

    if (normalizedUserId != null) {
      analyticsUpdates.add(analytics.setUserId(id: normalizedUserId));
    }
    if (normalizedUserType != null) {
      analyticsUpdates.add(
        analytics.setUserProperty(
          name: _analyticsParamUserType,
          value: normalizedUserType,
        ),
      );
    }

    if (analyticsUpdates.isNotEmpty) {
      await Future.wait(analyticsUpdates);
    }

    if (kDebugMode) {
      debugPrint(
        'Analytics user context => userId: $normalizedUserId, '
        'user_type: $normalizedUserType',
      );
    }
  }

  Future<void> clearAnalyticsUserContext() async {
    final FirebaseAnalytics? analytics = _analytics;
    if (analytics == null) return;

    await analytics.setUserId(id: "anonymous");
    await analytics.setUserProperty(
      name: _analyticsParamUserType,
      value: "anonymous",
    );
  }

  String? _normalizeAnalyticsValue(dynamic value) {
    if (value == null) return null;
    if (value is String) {
      final String trimmedValue = value.trim();
      return trimmedValue.isEmpty ? null : trimmedValue;
    }
    return value.toString();
  }

  Object? _normalizeAnalyticsObject(dynamic value) {
    if (value == null) return null;
    if (value is String) {
      final String trimmedValue = value.trim();
      return trimmedValue.isEmpty ? null : trimmedValue;
    }
    if (value is num || value is bool) {
      return value;
    }
    return value.toString();
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
