
import 'package:firebase_database/firebase_database.dart';

import 'FirebaseConstants.dart';
import 'FirebaseHelper.dart';

class FirebaseHelperImpl implements FirebaseHelper {
  final databaseReference = FirebaseDatabase.instance.reference();

  FirebaseHelperImpl();

  @override
  Stream<Event> getAppTheme() {
    return databaseReference
        .child(GENEREAL_SETTINGS)
        .child(DEFAULT_THEME)
        .onValue;
  }
}
