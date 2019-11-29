
class ApiResponse {
  bool status;
  String message;
  dynamic data;

  ApiResponse(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    data = json['Data'];
  }
}