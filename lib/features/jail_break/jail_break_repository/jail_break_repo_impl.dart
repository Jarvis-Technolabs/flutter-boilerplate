import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/core/flavour/flavour_config.dart';
import 'package:flutter_jailbreak_detection_plus/flutter_jailbreak_detection_plus.dart';

import 'jail_break_repo.dart';

class JailBreakRepoImpl extends JailBreakRepo {
  static const String _methodChannelName = 'jailBreakChannel';
  static const String _checkJailbreakMethod = 'checkJailbreak';
  static const MethodChannel _channel = MethodChannel(_methodChannelName);

  @override
  Future<bool?> getJailBreakStatus() async =>
      FlavourConfig.isProd() ? await checkJailBreak() : false;

  Future<bool?> checkJailBreak() async {
    if (Platform.isAndroid) {
      return await FlutterJailbreakDetectionPlus.jailbroken ||
          await _channel.invokeMethod(_checkJailbreakMethod);
    } else if (Platform.isIOS) {
      return await _channel.invokeMethod(_checkJailbreakMethod) as bool?;
    }
    return null;
  }
}
