class GetNotificationRequest {
  int? pageNo;

  GetNotificationRequest({
    this.pageNo,
  });

  GetNotificationRequest.fromJson(Map<String, dynamic> json) {
    pageNo = json['pageNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNo'] = this.pageNo;
    return data;
  }
}
