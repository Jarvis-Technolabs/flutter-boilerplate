class UserListResponse {
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;

  UserListResponse({
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });
}

class Data {
  String? firstName;

  Data({this.firstName});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    return data;
  }
}
