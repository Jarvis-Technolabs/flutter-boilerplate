import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/core/const/string_constants.dart';
import 'package:flutter_clean_architecture/core/util/permission_util/permission_util.dart';
import 'package:flutter_clean_architecture/core/util/screen_util/screen_util.dart';
import 'package:flutter_clean_architecture/core/util/utilities.dart';
import 'package:image_picker/image_picker.dart';

import '../../const/app_constants.dart';
import '../../localizations/app_localizations.dart';
import '../../ui/theme/colors/colors_inf.dart';

class ImagePickerUtil {
  /// Get from gallery
  static getFromGallery({required Function(File file) function}) async {
    XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 100);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      function(imageFile);
    }
  }

  static Future getPdfFile(
      {required Function(File file) function,
      required ColorsInf appColor,
      required BuildContext context}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [PDF],
    );
    if (result != null) {
      if (result.files[0].name.endsWith(PDF)) {
        PlatformFile file = result.files.first;
        function(File(file.path!));
      } else {
        Utilities.showToast(
          message: AppLocalizations.of(context).translate(LABEL_PDF_ERROR),
          appColors: appColor,
        );
      }
    }
  }

  static getFromCamera({required Function(File file) function}) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      function(imageFile);
    }
  }

  static Future<bool> getStoragePermission(ScreenUtil screenUtil,
          ColorsInf appColors, BuildContext context) async =>
      await PermissionUtil.getStoragePermission(
        screenUtil: screenUtil,
        appColors: appColors,
        context: context,
        permissionDescriptionText:
            AppLocalizations.of(context).translate(LABEL_STORAGE_PERMISSION_REQUIRED),
      );

  static Future<bool> getCameraPermission(ScreenUtil screenUtil,
          ColorsInf appColors, BuildContext context) async =>
      await PermissionUtil.getCameraPermission(
        screenUtil: screenUtil,
        appColors: appColors,
        context: context,
        permissionDescriptionText:
            AppLocalizations.of(context).translate(LABEL_CAMERA_PERMISSION_REQUIRED),
      );
}
