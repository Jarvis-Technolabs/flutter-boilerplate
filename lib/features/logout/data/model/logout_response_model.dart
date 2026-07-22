class LogoutResponseModel {
  bool? isLogOut;

  LogoutResponseModel({this.isLogOut});

  LogoutResponseModel.fromJson(Map<String, dynamic> json) {
    isLogOut = json['isLogOut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isLogOut'] = this.isLogOut;
    return data;
  }
}
