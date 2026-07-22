class LogoutRequestModel {
  int? userId;

  LogoutRequestModel({this.userId});

  LogoutRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = this.userId;
    return data;
  }
}
