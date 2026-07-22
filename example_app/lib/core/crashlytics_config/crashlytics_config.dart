import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../device_info/model/device_info_req_model.dart';
import '../device_info/repository/device_info_data_source.dart';
import '../di/injection_container.dart';

class CrashlyticsConfig {
  static const String KEY_EMAIL = "Email";
  static const String KEY_MOBILE_NUMBER = "Mobile Number";
  static const String KEY_DEVICE_ID = "Device Id";
  static const String KEY_OS_VERSION = "OS Version";
  static const String KEY_MANUFACTURER = "Manufacturer";

  static Future<void> setCrashlyticsData() async {
    DeviceInfoDataSource deviceInfoDataSource = sl();

    DeviceInfoReqModel deviceInfoReqModel =
        (await deviceInfoDataSource.getDeviceInfo())!;
    FirebaseCrashlytics.instance.setCustomKey(
        KEY_OS_VERSION,
        deviceInfoReqModel.deviceOsVersion! +
            " (SDK ${deviceInfoReqModel.appVersion})");
    FirebaseCrashlytics.instance.setCustomKey(
        KEY_MANUFACTURER,
        deviceInfoReqModel.deviceBrand! +
            " " +
            deviceInfoReqModel.deviceManufacturer!);
  }
}
