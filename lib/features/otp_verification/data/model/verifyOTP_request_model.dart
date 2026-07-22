class VerifyOTPRequestModel {
  String? otp;
  String? token;

  VerifyOTPRequestModel({this.otp, this.token});

  VerifyOTPRequestModel.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['otp'] = this.otp;
    data['token'] = this.token;
    return data;
  }
}
