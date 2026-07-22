class DeleteAccountResponseModel {
  bool? isAccountDeleted;

  DeleteAccountResponseModel({this.isAccountDeleted});

  DeleteAccountResponseModel.fromJson(Map<String, dynamic> json) {
    isAccountDeleted = json['isAccountDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isAccountDeleted'] = this.isAccountDeleted;
    return data;
  }
}
