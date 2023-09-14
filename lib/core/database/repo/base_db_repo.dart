import 'package:flutter_clean_architecture/core/database/app_db.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';

abstract class BaseDBRepo {
  AppDb? appDb = sl();
}
