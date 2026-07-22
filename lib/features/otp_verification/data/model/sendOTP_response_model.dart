class SendOTPResponseModel {
  String? otpToken;
  bool? isResendOtpAllowed;

  SendOTPResponseModel({
    this.otpToken,
    this.isResendOtpAllowed = false,
  });

  SendOTPResponseModel.fromJson(Map<String, dynamic> json) {
    otpToken = json['otpToken'];
    isResendOtpAllowed = json['isResendOtpAllowed'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['otpToken'] = this.otpToken;
    data['isResendOtpAllowed'] = this.isResendOtpAllowed;
    return data;
  }
}
