class DeviceInfoReqModel {
  final String? deviceId,
      deviceManufacturer,
      deviceOsVersion,
      deviceType,
      deviceTimeZone,
      deviceToken,
      appVersion,
      deviceBrand;

  DeviceInfoReqModel({
    this.deviceId,
    this.deviceManufacturer,
    this.deviceOsVersion,
    this.deviceType,
    this.deviceTimeZone,
    this.deviceToken,
    this.appVersion,
    this.deviceBrand,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceId'] = this.deviceId;
    data['deviceManufacturer'] = this.deviceManufacturer;
    data['deviceOSVersion'] = this.deviceOsVersion;
    data['deviceTimezone'] = this.deviceTimeZone;
    data['deviceToken'] = this.deviceToken;
    data['deviceType'] = this.deviceType;
    return data;
  }
}
