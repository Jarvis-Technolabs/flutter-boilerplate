class ForgotPasswordRequestModel {
  int? type;
  String? email;
  String? mobileNo;

  ForgotPasswordRequestModel({
    this.type,
    this.email,
    this.mobileNo,
  });

  ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    email = json['email'];
    mobileNo = json['mobileNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['email'] = this.email;
    data['mobileNo'] = this.mobileNo;
    return data;
  }
}
