class SendOTPRequestModel {
  String? mobileNo;
  String? email;
  int? sendOtpTo;
  int? sendOtpFor;
  bool? isResendOtp;

  SendOTPRequestModel({
    this.mobileNo,
    this.email,
    this.sendOtpTo,
    this.sendOtpFor,
    this.isResendOtp = false,
  });

  SendOTPRequestModel.fromJson(Map<String, dynamic> json) {
    mobileNo = json['mobileNo'];
    email = json['email'];
    sendOtpTo = json['sendOtpTo'];
    sendOtpFor = json['sendOtpFor'];
    isResendOtp = json['isResendOtp'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mobileNo'] = this.mobileNo;
    data['email'] = this.email;
    data['sendOtpTo'] = this.sendOtpTo;
    data['sendOtpFor'] = this.sendOtpFor;
    data['isResendOtp'] = this.isResendOtp;
    return data;
  }
}
