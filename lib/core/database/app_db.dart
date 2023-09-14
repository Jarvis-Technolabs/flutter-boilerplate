import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:encrypted_drift/encrypted_drift.dart';
import 'package:flutter_clean_architecture/core/flavour/flavour_config.dart';

import '../const/db_constants.dart';

part 'app_db.g.dart';

@DriftDatabase(
  tables: [],
  queries: {},
)
class AppDb extends _$AppDb {
  AppDb()
      : super(
          (EncryptedExecutor.inDatabaseFolder(
            path: APP_DB_NAME,
            logStatements: true,
            password: utf8.decode(
              FlavourConfig.instance!.DATABASE_PASSWORD,
            ),
          )),
        );

  @override
  int get schemaVersion => 1;
}
