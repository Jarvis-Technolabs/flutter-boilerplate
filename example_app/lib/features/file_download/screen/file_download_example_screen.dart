import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/core/util/permission_util/permission_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/const/string_constants.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/ui/widgets/button.dart';
import '../../../core/localizations/localization_extension.dart';

class FileDownloadExampleScreen extends BaseBlocWidget {
  @override
  State<FileDownloadExampleScreen> createState() =>
      _FileDownloadExampleScreenState();
}

class _FileDownloadExampleScreenState
    extends BaseBlocWidgetState<FileDownloadExampleScreen>
    with TickerProviderStateMixin {
  /// initialize ReceivePort
  ReceivePort _port = ReceivePort();
  bool isHideDialog = false;

  static String portName = "downloader_send_port";

  @override
  void initState() {
    /// call _downloadListener
    _downloadListener();
    super.initState();
  }

  @override
  void dispose() {
    _port.close();
    IsolateNameServer.removePortNameMapping(portName);
    super.dispose();
  }

  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_DOWNLOAD_FILE_EXAMPLE)
              .getWhiteColor17W500Inter(
                  screenUtil: screenUtil, appColors: appColors),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              title:
              context.tr(LABEL_DOWNLOAD_FILE),
              backgroundColor: appColors.primaryColor,
              buttonTextColor: appColors.whiteColor,
              selectHandler: () => _downLoadFile(
                  url: "https://www.gstatic.com/webp/gallery3/1.sm.png"),
              // call _pickFile method
              borderColor: appColors.primaryColor,
            ).paddingOnly(
              screenUtil,
              paddingBottom: 30,
            ),
          ],
        ).paddingAll(
          padding: 20,
          screenUtil: screenUtil,
        ),
      );

  /// listen events of downloading task
  _downloadListener() {
    IsolateNameServer.registerPortWithName(_port.sendPort, portName);
    _port.listen((dynamic data) async {
      String id = data[0];
      int status = data[1];
      int progress = data[2];

      /// hide progress dialog when file downloaded
      if (progress == 100 && isHideDialog) {
        isHideDialog = false;
        hideDialog();
      }
      if (status.toString() == "DownloadTaskStatus(3)" && progress == 100) {
        String query = "SELECT * FROM task WHERE task_id='" + id + "'";
        List<DownloadTask>? tasks =
            await FlutterDownloader.loadTasksWithRawQuery(
          query: query,
        );

        ///if the task exists, open it
        if (tasks != null)
          FlutterDownloader.open(
            taskId: id,
          );
      }
    });
    FlutterDownloader.registerCallback(downloadCallback);
  }

  /// callback for download
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send = IsolateNameServer.lookupPortByName(portName);
    send?.send([id, status, progress]);
  }

  /// download file
  Future<void> _downLoadFile({required String url}) async {
    /// check storage permission granted or not
    bool storagePermissionGranted = await PermissionUtil().getStoragePermission(
        context: context,
        permissionDescriptionText:
            "Permission is required for download the file");
    if (storagePermissionGranted) {
      isHideDialog = true;

      /// show progress dialog
      showDialogView();
      String _localPath = (await findLocalPath()) +
          Platform.pathSeparator +
          'ExampleApp' +
          Platform.pathSeparator;
      final savedDir = Directory(_localPath);
      bool hasExisted = await savedDir.exists();

      /// create directory if not exist
      if (!hasExisted) {
        savedDir.create();
      }
      await FlutterDownloader.enqueue(
          url: url,
          savedDir: _localPath,
          showNotification: true,
          openFileFromNotification: true,
          saveInPublicStorage: true);
    }
  }

  /// find local path
  Future<String> findLocalPath() async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
