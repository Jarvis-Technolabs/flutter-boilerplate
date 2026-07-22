import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_and_file_picker_utility/image_and_file_picker_utility.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../ui/theme/colors/colors_inf.dart';
import '../screen_util/screen_util.dart';

class PermissionUtil extends PermissionHandler {
  /// This permission is use for the access the device location
  Future<bool> getLocationPermission({
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
          permissionDescriptionText: permissionDescriptionText,
        );
        return false;
      } else {
        return false;
      }
    }
  }
}
