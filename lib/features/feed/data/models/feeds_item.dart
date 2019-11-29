class InstitutionsItem {
  int InstitutionId;
  String InstitutionName;

  InstitutionsItem(
      {this.InstitutionId,
        this.InstitutionName});

  InstitutionsItem.fromJson(Map<String, dynamic> json) {
    InstitutionId = json['InstitutionId'];
    InstitutionName = json['InstitutionName'];
  }
}
