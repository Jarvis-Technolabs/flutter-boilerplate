import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../const/app_constants.dart';

class LoggerFileUtil {
  static Future<File> get getTemporaryFile async {
    if (Platform.isAndroid) {
      return File('${ANDROID_DOWNLOAD_PATH}/${LOG_FILE_NAME}');
    } else {
      final directory = await getApplicationDocumentsDirectory();
      return File('${directory.path}/${LOG_FILE_NAME}');
    }
  }

  Future<void> saveLogs(String data) async {
    PermissionStatus permissionGranted = await Permission.storage.status;

    if (permissionGranted == PermissionStatus.granted) {
      File file = await getTemporaryFile;
      if (!await file.exists()) await file.create();
      String fileData = await file.readAsString();
      await file.writeAsString(fileData + "\n\n" + data, flush: true);
    }
  }

  Future<void> clearLogs() async {
    File file = await getTemporaryFile;
    if (await file.exists()) await file.writeAsString("");
  }
}
