import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class FileUtil {
  static var bodyBytes;

  static Future<String> downloadAndSaveImage(String url) async {
    var fileName = "image" + DateTime.now().millisecondsSinceEpoch.toString();
    var directory = await getApplicationDocumentsDirectory();
    var filePath = '${directory.path}/$fileName';
    var file = File(filePath);
    if (!await file.exists()) file.create();
    await file.writeAsBytes(bodyBytes);
    return filePath;
  }

  static Future<bool> checkValidImageUrl(String url) async {
    var response = await http.get(url);
    if (response.headers['content-type'].startsWith("image/")) {
      bodyBytes = response.bodyBytes;
      return true;
    } else {
      return false;
    }
  }
}
