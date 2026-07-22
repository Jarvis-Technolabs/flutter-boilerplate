class ResetPasswordResponseModel {
  String? isPasswordReset;
  String? message;

  ResetPasswordResponseModel({this.isPasswordReset, this.message});

  ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    isPasswordReset = json['isPasswordReset'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isPasswordReset'] = this.isPasswordReset;
    data['message'] = this.message;
    return data;
  }
}
