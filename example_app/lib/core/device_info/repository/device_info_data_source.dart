import '../model/device_info_req_model.dart';

abstract class DeviceInfoDataSource {
  Future<DeviceInfoReqModel?> getDeviceInfo();
}
