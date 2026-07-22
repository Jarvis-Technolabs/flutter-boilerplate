import 'dart:convert';

class ApiResponse {
  bool? status;
  String? message;
  dynamic data;
  int? statusCode;
  int? perPage;
  int? total;
  int? totalPages;

  ApiResponse({
    this.status,
    this.message,
    this.data,
    this.statusCode,
  });

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json.containsKey('success') ? json['success'] : null;
    message = json.containsKey('message') ? json['message'] : null;
    perPage = json.containsKey("per_page") ? json['per_page'] : null;
    total = json.containsKey("total") ? json['total'] : null;
    totalPages = json.containsKey("total_pages") ? json['total_pages'] : null;
    data = json['data'];
    statusCode = json.containsKey('statusCode') ? json['statusCode'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.status;
    data['message'] = this.message;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = json.encode(this.data as Map);
    }
    data['statusCode'] = this.statusCode;
    return data;
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}
