class Data {
  bool actionStatus;
  String actionMessage;

  Data(Map<String, dynamic> json) {
    actionStatus = json['ActionStatus'];
    actionMessage = json['ActionMessage'];
  }
}
