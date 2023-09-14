class GeneratePublicTokenRequest {
  String? userID;
  String? extraToken;

  GeneratePublicTokenRequest({this.userID, this.extraToken});

  GeneratePublicTokenRequest.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    extraToken = json['extraToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['UserID'] = this.userID;
    data['extraToken'] = this.extraToken;
    return data;
  }
}
