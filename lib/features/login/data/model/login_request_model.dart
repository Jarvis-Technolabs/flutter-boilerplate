class LoginRequestModel {
  String? mobileNo;
  String? password;

  LoginRequestModel({this.mobileNo, this.password});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    mobileNo = json['mobileNo'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mobileNo'] = this.mobileNo;
    data['password'] = this.password;
    return data;
  }
}
