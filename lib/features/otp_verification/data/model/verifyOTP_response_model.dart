class VerifyOTPResponseModel {
  bool? isOTPVerified;

  VerifyOTPResponseModel({this.isOTPVerified});

  VerifyOTPResponseModel.fromJson(Map<String, dynamic> json) {
    isOTPVerified = json['isOTPVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isOTPVerified'] = this.isOTPVerified;
    return data;
  }
}
