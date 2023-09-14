import 'dart:io';

import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/preference/preference_helper.dart';
import 'package:flutter_clean_architecture/core/util/screen_util/screen_util.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:open_filex/open_filex.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const/app_constants.dart';
import '../firebase_notification_data_source/firebase_notification_data_source.dart';
import '../ui/theme/colors/colors_inf.dart';
import 'image_picker_util/image_picker_util.dart';

Logger? logger = sl();

class Utilities {
  ///To open default app system
  static void launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      logger!.d('Could not launch $url');
    }
  }

  ///To open default map app
  static void launchMapURL(double latitude, double longitude) async {
    String appleApp = '$APPLE_MAP_APP_URL${latitude},${longitude}';
    String appleMaps = '${APPLE_MAP_URL}${latitude},${longitude}';
    String androidUrl = '$LAUNCH_MAP_URL${latitude},${longitude}';
    if (Platform.isAndroid) {
      if (await canLaunchUrl(Uri.parse(androidUrl))) {
        await launchUrl(Uri.parse(androidUrl));
      }
    } else if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(appleMaps))) {
        logger!.d("apple map " + appleMaps);
        await launchUrl(Uri.parse(Uri.encodeFull(appleMaps)));
      } else if (await canLaunchUrl(Uri.parse(APPLE_MAP_APP))) {
        logger!.d("web apple map " + APPLE_MAP_APP);
        await launchUrl(Uri.parse(Uri.encodeFull(appleApp)));
      }
    }
  }

  ///Launch Facebook
  static launchFacebook({
    required String androidURL,
    required String iosURL,
    required String fallBackURL,
  }) async {
    String url;
    if (Platform.isIOS) {
      url = iosURL;
    } else {
      url = androidURL;
    }

    try {
      bool launched = await launchUrl(
        Uri.parse(url),
        webViewConfiguration: WebViewConfiguration(),
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        await launchUrl(
          Uri.parse(fallBackURL),
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      logger!.d('Could not launch ${e.toString()}');
    }
  }

  ///Convert Hax Color Code To Color Object
  static Color convertHaxColorCodeToColorObject({
    required String colorCode,
  }) =>
      Color(
        int.parse("0xff${colorCode.replaceAll("#", "")}"),
      );

  ///Convert Hax Color Code To String
  static String convertHaxColorCodeToString({
    required Color color,
  }) =>
      color.value.toRadixString(16).substring(2, 8);

  ///SuperTooltip
  static SuperTooltip toolTip(
    ColorsInf appColors,
    Widget child, {
    TooltipDirection toolTipDirection = TooltipDirection.up,
  }) =>
      SuperTooltip(
        borderRadius: 4,
        arrowLength: 4,
        arrowBaseWidth: 8,
        dismissOnTapOutside: true,
        borderColor: appColors.transparentColor,
        backgroundColor: appColors.boxBackgroundColor,
        popupDirection: toolTipDirection,
        arrowTipDistance: 12.0,
        hasShadow: false,
        outsideBackgroundColor: appColors.transparentColor,
        content: Material(
          color: appColors.transparentColor,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: SingleChildScrollView(child: child),
          ),
        ),
      );

  ///Get File Using URL
  static Future<File> getFileUsingURL(String url) async =>
      await DefaultCacheManager().getSingleFile(url);

  ///Show Toast
  static void showToast({
    required String message,
    required ColorsInf appColors,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: appColors.blackColor,
      textColor: appColors.whiteColor,
      timeInSecForIosWeb: 5,
    );
  }

  ///Clear data for logout and session expire
  static Future<void> clearData() async {
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
  static Future<void> clearAllData() async {
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
  static void printFullLog(String text) {
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

  /// pick files
  static Future<List<PlatformFile>?> pickFiles({
    required ColorsInf appColor,
    required ScreenUtil screenUtil,
    required BuildContext context,
    bool? allowedMultiple = false,
    bool? allowedCompression = true,
    List<String>? allowedExtensions,
  }) async {

    /// check storage permission granted or not
    bool storagePermissionGranted = await ImagePickerUtil.getStoragePermission(
        screenUtil, appColor, context);
    if (storagePermissionGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: allowedExtensions == null?FileType.any:FileType.custom,

        /// Use FileType.any if you want pick all type files
        allowedExtensions: allowedExtensions??[], // Not required for FileType.any
        allowMultiple: allowedMultiple!,
        allowCompression: allowedCompression!,
      );
      if (result != null) {
        List<PlatformFile> files = result.files;
        return files ;
      }else{
        return null ;
      }
    }
    return null;
  }

  /// open file method
  static Future<void> openFile({required String path}) async {
    await OpenFilex.open(path);
  }
}
