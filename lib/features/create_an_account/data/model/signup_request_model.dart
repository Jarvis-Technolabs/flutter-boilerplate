class SignupRequestModel {
  String? name;
  String? email;
  String? mobileNo;
  String? password;

  SignupRequestModel({
    this.name,
    this.email,
    this.mobileNo,
    this.password,
  });

  SignupRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobileNo'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobileNo'] = this.mobileNo;
    data['password'] = this.password;
    return data;
  }
}
