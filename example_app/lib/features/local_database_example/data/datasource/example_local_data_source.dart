import 'package:example_app/core/database/repo/base_db_repo.dart';

import '../../../../core/database/app_db.dart';

abstract class ExampleLocalDataSource extends BaseDBRepo {
  Future<List<ExampleTable>> getAllData();

  Future insertData(ExampleTable addressTables);

  Future<int> deleteData(int id);

  Future<int> clearDb();
}
