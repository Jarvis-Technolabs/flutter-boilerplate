import 'package:drift/drift.dart';
import 'package:example_app/core/database/app_db.dart';
import 'example_local_data_source.dart';

class ExampleLocalDataSourceImpl extends ExampleLocalDataSource {
  @override
  Future<List<ExampleTable>> getAllData() async =>
      await appDb!.select(appDb!.dbExampleTable).get();

  /// fetch all the records

  @override
  Future insertData(ExampleTable exampleTable) async {
    /// insert/update record
    await appDb!.batch(
      (b) async {
        b.insert(
          appDb!.dbExampleTable,
          exampleTable,
          mode: InsertMode.replace,
        );
      },
    );
  }

  @override
  Future<int> deleteData(int id) async {
    /// delete record
    return await (appDb!.delete(appDb!.dbExampleTable)
          ..where(
            (tbl) => tbl.rank.equals(id),
          ))
        .go();
  }

  @override
  Future<int> clearDb() async =>
      await appDb!.delete(appDb!.dbExampleTable).go();

  /// clear database
}
