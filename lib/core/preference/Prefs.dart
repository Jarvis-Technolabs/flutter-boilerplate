import 'dart:async' show Future;

import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

/// The App's Preferences.
class Prefs {
  static Future<SharedPreferences> get _instance async =>
      _prefs ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefs;

  static SharedPreferences _prefsInstance;

  /// In case the developer does not explicitly call the init() function.
  static bool _initCalled = false;

  /// Initialize the SharedPreferences object in the State object's iniState() function.
  static Future<SharedPreferences> init() async {
    _initCalled = true;
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  /// Best to clean up by calling this function in the State object's dispose() function.
  static void dispose() {
    _prefs = null;
    _prefsInstance = null;
  }

  /// Returns all keys in the persistent storage.
  static Set<String> getKeys() {
    assert(_initCalled,
        "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call Prefs.getKeysF() instead. SharedPreferences not ready yet!");
    return _prefsInstance.getKeys();
  }

  /// Returns a Future.
  static Future<Set<String>> getKeysF() async {
    Set<String> value;
    if (_prefsInstance == null) {
      var prefs = await _instance;
      value = prefs?.getKeys() ?? Set();
    } else {
      value = getKeys();
    }
    return value;
  }

  /// Reads a value of any type from persistent storage.
  static dynamic get(String key) {
    assert(_initCalled,
        "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call Prefs.getF(key) instead. SharedPreferences not ready yet!");
    return _prefsInstance.get(key);
  }

  /// Returns a Future.
  static Future<dynamic> getF(String key) async {
    dynamic value;
    if (_prefsInstance == null) {
      var prefs = await _instance;
      value = prefs?.get(key);
    } else {
      value = get(key);
    }
    return value;
  }

  static bool getBool(String key, [bool defValue]) {
    assert(_initCalled,
        "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call Prefs.getBoolF(key) instead. SharedPreferences not ready yet!");
    return _prefsInstance.getBool(key) ?? defValue ?? false;
  }

  /// Returns a Future.
  static Future<bool> getBoolF(String key, [bool defValue]) async {
    bool value;
    if (_prefsInstance == null) {
      var prefs = await _instance;
      value = prefs?.getBool(key) ?? defValue ?? false;
    } else {
      value = getBool(key);
    }
    return value;
  }

  static int getInt(String key, [int defValue]) {
    assert(_initCalled,
        "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call Prefs.getIntF(key) instead. SharedPreferences not ready yet!");
    return _prefsInstance.getInt(key) ?? defValue ?? 0;
  }

  /// Returns a Future.
  static Future<int> getIntF(String key, [int defValue]) async {
    int value;
    if (_prefsInstance == null) {
      var prefs = await _instance;
      value = prefs?.getInt(key) ?? defValue ?? 0;
    } else {
      value = getInt(key);
    }
    return value;
  }

  static double getDouble(String key, [double defValue]) {
    assert(_initCalled,
        "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call Prefs.getDoubleF(key) instead. SharedPreferences not ready yet!");
    return _prefsInstance.getDouble(key) ?? defValue ?? 0.0;
  }

  /// Returns a Future.
  static Future<double> getDoubleF(String key, [double defValue]) async {
    double value;
    if (_prefsInstance == null) {
      var prefs = await _instance;
      value = prefs?.getDouble(key) ?? defValue ?? 0.0;
    } else {
      value = getDouble(key);
    }
    return value;
  }

  static String getString(String key, [String defValue]) {
    assert(_initCalled,
        "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call Prefs.getStringF(key)instead. SharedPreferences not ready yet!");
    return _prefsInstance.getString(key) ?? defValue ?? "";
  }

  /// Returns a Future.
  static Future<String> getStringF(String key, [String defValue]) async {
    String value;
    if (_prefsInstance == null) {
      var prefs = await _instance;
      value = prefs?.getString(key) ?? defValue ?? "";
    } else {
      value = getString(key);
    }
    return value;
  }

  static List<String> getStringList(String key, [List<String> defValue]) {
    assert(_initCalled,
        "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call Prefs.getStringListF(key) instead. SharedPreferences not ready yet!");
    return _prefsInstance.getStringList(key) ?? defValue ?? [""];
  }

  /// Returns a Future.
  static Future<List<String>> getStringListF(String key,
      [List<String> defValue]) async {
    List<String> value;
    if (_prefsInstance == null) {
      var prefs = await _instance;
      value = prefs?.getStringList(key) ?? defValue ?? [""];
    } else {
      value = getStringList(key);
    }
    return value;
  }

  /// Saves a boolean [value] to persistent storage in the background.
  /// If [value] is null, this is equivalent to calling [remove()] on the [key].
  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs?.setBool(key, value) ?? Future.value(false);
  }

  /// Saves an integer [value] to persistent storage in the background.
  /// If [value] is null, this is equivalent to calling [remove()] on the [key].
  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs?.setInt(key, value) ?? Future.value(false);
  }

  /// Saves a double [value] to persistent storage in the background.
  /// Android doesn't support storing doubles, so it will be stored as a float.
  /// If [value] is null, this is equivalent to calling [remove()] on the [key].
  static Future<bool> setDouble(String key, double value) async {
    var prefs = await _instance;
    return prefs?.setDouble(key, value) ?? Future.value(false);
  }

  /// Saves a string [value] to persistent storage in the background.
  /// If [value] is null, this is equivalent to calling [remove()] on the [key].
  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs?.setString(key, value) ?? Future.value(false);
  }

  /// Saves a list of strings [value] to persistent storage in the background.
  /// If [value] is null, this is equivalent to calling [remove()] on the [key].
  static Future<bool> setStringList(String key, List<String> value) async {
    var prefs = await _instance;
    return prefs?.setStringList(key, value) ?? Future.value(false);
  }

  /// Removes an entry from persistent storage.
  static Future<bool> remove(String key) async {
    var prefs = await _instance;
    return prefs?.remove(key) ?? Future.value(false);
  }

  /// Completes with true once the user preferences for the app has been cleared.
  static Future<bool> clear() async {
    var prefs = await _instance;
    return prefs?.clear() ?? Future.value(false);
  }
}
