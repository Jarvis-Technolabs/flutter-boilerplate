import 'package:flutter_clean_architecture/features/feed/data/database/DbInstitutions.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'AppDb.g.dart';

@UseMoor(
  tables: [DbInstitutions],
    queries: {"selectInstitutions": "Select * FROM institutions"}
)
// _$AppDatabase is the name of the generated class
//Don't delete this command => flutter packages pub run build_runner watch
class AppDb extends _$AppDb {
  AppDb()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'app-test-db',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;
}
