class GetMobileAPPConfigurationResponse {
  int? minimumAndroidVersion, minimumIOSVersion;

  GetMobileAPPConfigurationResponse({
    this.minimumAndroidVersion,
    this.minimumIOSVersion,
  });

  GetMobileAPPConfigurationResponse.fromJson(Map<String, dynamic> json) {
    minimumAndroidVersion = json['minimumAndroidVersion'];
    minimumIOSVersion = json['minimumiOSVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minimumAndroidVersion'] = this.minimumAndroidVersion;
    data['minimumiOSVersion'] = this.minimumIOSVersion;
    return data;
  }
}
