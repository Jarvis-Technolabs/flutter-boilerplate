import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/const/string_constants.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/custom_alert_with_two_buttons.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/show_app_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../localizations/app_localizations.dart';
import '../../ui/theme/colors/colors_inf.dart';
import '../screen_util/screen_util.dart';

class PermissionUtil {
  /// This permission is use for the access the device storage
  static Future<bool> getStoragePermission({
    required BuildContext context,
    required String permissionDescriptionText,
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
  }) async {
    PermissionStatus status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      return true;
    } else {
      if (Platform.isAndroid) {
        if (status == PermissionStatus.permanentlyDenied ||
            status.isRestricted) {
          customDialog(
            context: context,
            screenUtil: screenUtil,
            appColors: appColors,
            permissionDescriptionText: permissionDescriptionText,
          );
          return false;
        } else {
          return false;
        }
      } else if (Platform.isIOS) {
        Permission.storage.request().then(
          (status) async {
            if (status == PermissionStatus.denied ||
                status == PermissionStatus.restricted) {
              customDialog(
                context: context,
                screenUtil: screenUtil,
                appColors: appColors,
                permissionDescriptionText: permissionDescriptionText,
              );
              return false;
            } else {
              return false;
            }
          },
        );
      }
    }
    return false;
  }

  /// This permission is use for the access the camera
  static Future<bool> getCameraPermission({
    required BuildContext context,
    required String permissionDescriptionText,
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
  }) async {
    PermissionStatus status = await Permission.camera.request();
    if (status == PermissionStatus.granted) {
      return true;
    } else if (status == PermissionStatus.denied) {
      return false;
    } else {
      if ((Platform.isAndroid &&
              status == PermissionStatus.permanentlyDenied) ||
          (Platform.isIOS &&
              (status == PermissionStatus.restricted ||
                  status == PermissionStatus.permanentlyDenied))) {
        customDialog(
          context: context,
          screenUtil: screenUtil,
          appColors: appColors,
          permissionDescriptionText: permissionDescriptionText,
        );
        return false;
      } else {
        return false;
      }
    }
  }

  /// This permission is use for the access the device location
  static Future<bool> getLocationPermission({
    required BuildContext context,
    required String permissionDescriptionText,
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
  }) async {
    PermissionStatus status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      return true;
    } else if (status == PermissionStatus.denied) {
      return false;
    } else {
      if ((Platform.isAndroid &&
              status == PermissionStatus.permanentlyDenied) ||
          (Platform.isIOS &&
              (status == PermissionStatus.restricted ||
                  status == PermissionStatus.permanentlyDenied))) {
        customDialog(
          context: context,
          screenUtil: screenUtil,
          appColors: appColors,
          permissionDescriptionText: permissionDescriptionText,
        );
        return false;
      } else {
        return false;
      }
    }
  }

  /// This permission is use for the access the photos (For ios only)
  static Future<bool> getPhotosPermission({
    required BuildContext context,
    required String permissionDescriptionText,
    ScreenUtil? screenUtil,
    ColorsInf? appColors,
  }) async {
    PermissionStatus status = await Permission.photos.request();
    if (status == PermissionStatus.granted ||
        status == PermissionStatus.limited) {
      return true;
    } else if (status == PermissionStatus.denied) {
      return false;
    } else {
      if (status == PermissionStatus.restricted ||
          status == PermissionStatus.permanentlyDenied) {
        customDialog(
          context: context,
          screenUtil: screenUtil,
          appColors: appColors,
          permissionDescriptionText: permissionDescriptionText,
        );
        return false;
      } else {
        return false;
      }
    }
  }

  /// This dialog show while the user permanently denied the permission
  static customDialog({
    required BuildContext context,
    required String permissionDescriptionText,
    ScreenUtil? screenUtil,
    ColorsInf? appColors,
  }) {
    showAppDialog(
      context: context,
      appColors: appColors!,
      screenUtil: screenUtil!,
      child: CustomAlertWithTwoButtons(
        AppLocalizations.of(context).translate(LABEL_PERMISSION_REQUIRED),
        permissionDescriptionText,
        onClick: () async => await openAppSettings(),
        buttonTitleText: LABEL_GO_TO_SETTING,
      ),
    );
  }
}
