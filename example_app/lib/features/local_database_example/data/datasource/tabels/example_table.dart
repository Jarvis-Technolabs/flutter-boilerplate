import 'package:drift/drift.dart';

import '../../../../../core/const/db_constants.dart';

/// Example table
/// Add DbExampleTable to DriftDatabase's tables array in the app-db.dart and call the build runner command  from the terminal
@DataClassName(EXAMPLE_TABLE)
class DbExampleTable extends Table {
  IntColumn get rank => integer().named("rank")();

  TextColumn get title => text().named("title")();

  @override
  Set<Column> get primaryKey => {rank}; // define primary key column

  @override
  String get tableName => 'ExampleTable';
}
