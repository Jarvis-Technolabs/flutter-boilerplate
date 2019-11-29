import 'package:moor/moor.dart';

@DataClassName("Institutions")
class DbInstitutions extends Table {
  IntColumn get institutionId => integer().named('InstitutionId')();

  TextColumn get institutionName => text().named('InstitutionName')();

  @override
  Set<Column> get primaryKey => {institutionId};

  @override
  String get tableName => 'institutions';
}
