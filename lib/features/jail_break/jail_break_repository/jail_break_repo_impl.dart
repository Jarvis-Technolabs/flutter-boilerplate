import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/core/flavour/flavour_config.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

import 'jail_break_repo.dart';

class JailBreakRepoImpl extends JailBreakRepo {
  String methodChannelName = "jailBreakChannel";

  @override
  Future<bool?> getJailBreakStatus() async =>
      FlavourConfig.isProd() ? await checkJailBreak() : false;

  Future<bool?> checkJailBreak() async {
    if (Platform.isAndroid) {
      return await FlutterJailbreakDetection.jailbroken ||
          await MethodChannel(methodChannelName).invokeMethod("");
    } else if (Platform.isIOS) {
      return await MethodChannel(methodChannelName).invokeMethod('') as bool?;
    }
    return null;
  }
}
