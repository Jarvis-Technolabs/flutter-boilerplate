import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class RegistrationRequest {
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String deviceId;
  final String fcmId;
  final String deviceToken;

  RegistrationRequest(
      {this.firstName,
        this.lastName,
        this.mobileNumber,
        this.deviceId,
        this.fcmId,
        this.deviceToken});

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) {
    return RegistrationRequest(
        firstName: json['FirstName'],
        lastName: json['LastName'],
        mobileNumber: json['MobileNumber'],
        deviceId: json['DeviceId'],
        fcmId: json['Fcmid'],
        deviceToken: json['DeviceToken']);
  }

  Map toJson() {
    var map = new Map<String, dynamic>();
    map['FirstName'] = firstName;
    map['LastName'] = lastName;
    map['MobileNumber'] = mobileNumber;
    map['DeviceId'] = deviceId;
    map['Fcmid'] = fcmId;
    map['DeviceToken'] = deviceToken;

    return map;
  }
}
