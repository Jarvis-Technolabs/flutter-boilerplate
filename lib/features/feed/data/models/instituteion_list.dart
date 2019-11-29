import 'package:flutter_clean_architecture/core/models/data.dart';

import 'feeds_item.dart';

class InstitutionList extends Data {
  List<InstitutionsItem> institutes;

  InstitutionList(Map<String, dynamic> jsonMap) : super(jsonMap) {
    var list = jsonMap['Institutions'] as List;
    if (actionStatus) {
      institutes = list.map((i) => InstitutionsItem.fromJson(i)).toList();
    }
  }
}
