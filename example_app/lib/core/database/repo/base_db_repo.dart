import 'package:example_app/core/database/app_db.dart';
import 'package:example_app/core/di/injection_container.dart';

abstract class BaseDBRepo {
  AppDb? appDb = sl();
}
