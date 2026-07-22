class PublicTokenResponse {
  String? token;

  PublicTokenResponse({
    this.token,
  });

  PublicTokenResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
