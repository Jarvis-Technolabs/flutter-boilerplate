import 'package:flutter_clean_architecture/core/database/AppDb.dart';

class InstitutionRepo extends AppDb {
  Stream<List<Institutions>> watchAllInstitutions() =>
      select(dbInstitutions).watch();

  Future<void> updateFreshInstitutions(List<Institutions> dbInstitutionList) {
    if (dbInstitutionList == null) {
//      return deleteAllInstitutions();
    } else {
      return transaction((value) async {
//        await deleteInstitutions(institutionsIds);
        await into(dbInstitutions)
            .insertAll(dbInstitutionList, orReplace: true);
      });
    }
  }
}
