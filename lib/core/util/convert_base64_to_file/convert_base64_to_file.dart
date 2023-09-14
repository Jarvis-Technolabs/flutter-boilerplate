import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/util/screen_util/screen_util.dart';
import 'package:path_provider/path_provider.dart';

import '../../const/app_constants.dart';
import '../../ui/theme/colors/colors_inf.dart';

Future<String> convertToPdfFromBase64({
  required String base64String,
  String? fileName,
  String? fileType = PDF_EXTENSION,
}) async {
  Directory dir = await getApplicationDocumentsDirectory();

  List<int> pdf = base64.decode(base64String);

  String fileURL = "${dir.path}/${fileName}_${CURRENT_TIME_STAMP}${fileType}";

  File file = File(fileURL);

  if (!await file.exists()) file.create();
  file.writeAsBytes(pdf);
  return fileURL;
}

Future<String?> downloadToPdfFromBase64({
  required String base64String,
  String? fileName,
  String? fileType = PDF_EXTENSION,
  required ScreenUtil screenUtil,
  required ColorsInf appColors,
  required BuildContext context,
}) async {
  String path;
  if (Platform.isIOS) {
    Directory? directory = await getApplicationDocumentsDirectory();
    path = directory.path;
  } else {
    path = ANDROID_DOWNLOAD_PATH;
  }

  List<int> pdf = base64.decode(base64String);

  String fileURL = "${path}/${fileName}_${CURRENT_TIME_STAMP}${fileType}";

  File file = File(fileURL);

  if (!await file.exists()) file.create();
  await file.writeAsBytes(pdf);

  return fileURL;
}
