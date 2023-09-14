import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FilePaths {
  ///App data directory
  Future<String> getApplicationDocumentsPath() async =>
      (await getApplicationDocumentsDirectory()).path;

  ///App cache directory
  Future<String> getTemporaryFileDirectory() async =>
      (await getTemporaryDirectory()).path;

  ///Android only
  ///External data directory
  Future<String?> getExternalStorageFile() async {
    try {
      final Directory? directory = await getExternalStorageDirectory();
      if (directory != null) {
        return directory.path;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
