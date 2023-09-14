import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../const/string_constants.dart';
import '../../enums/platform_type.dart';
import '../model/device_info_req_model.dart';
import 'device_info_data_source.dart';

class DeviceInfoDataSourceImpl implements DeviceInfoDataSource {
  @override
  Future<DeviceInfoReqModel?> getDeviceInfo() async {
    String fcmID = "";
    DeviceInfoReqModel? deviceInfoReqModel;
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String platformVersion = "";
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      platformVersion = packageInfo.version;
    } on Exception {
      platformVersion = LABEL_PLATFORM_ERROR;
    }
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      String identifier = androidDeviceInfo.id;
      deviceInfoReqModel = DeviceInfoReqModel(
        deviceId: identifier,
        deviceManufacturer: androidDeviceInfo.model,
        deviceOsVersion: platformVersion,
        deviceType: PlatformType.Android.name,
        deviceTimeZone: DateTime.now().timeZoneName,
        deviceToken: fcmID,
        appVersion: androidDeviceInfo.version.sdkInt.toString(),
        deviceBrand: androidDeviceInfo.manufacturer,
      );
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      String identifier = iosDeviceInfo.identifierForVendor!;
      deviceInfoReqModel = DeviceInfoReqModel(
        deviceId: identifier,
        deviceManufacturer: iosDeviceInfo.utsname.machine,
        deviceOsVersion: platformVersion,
        deviceType: PlatformType.Ios.name,
        deviceTimeZone: DateTime.now().timeZoneName,
        deviceToken: fcmID,
        appVersion: iosDeviceInfo.systemVersion,
        deviceBrand: iosDeviceInfo.name,
      );
    }
    return deviceInfoReqModel;
  }
}
