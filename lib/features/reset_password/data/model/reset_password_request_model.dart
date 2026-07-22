class ResetPasswordRequestModel {
  String? id;
  String? password;

  ResetPasswordRequestModel({
    this.id,
    this.password,
  });

  ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['password'] = this.password;
    return data;
  }
}
