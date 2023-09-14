import 'preference.dart';
import 'preference_constants.dart';
import 'preference_helper.dart';

class PreferenceHelperImpl implements PreferenceHelper {
  @override
  Future<void> clearAllPrefData() async {
    await Preference.clear();
    await Preference.clearSecuredString();
  }

  @override
  String getLanguage() => Preference.getString(KEY_LANG, "en");

  @override
  Future<bool> setLanguage(String value) =>
      Preference.setString(KEY_LANG, value);

  @override
  bool getIsDarkTheme() => Preference.getBool(KEY_IS_DARK, false);

  @override
  Future<bool> setIsDarkTheme(bool isDark) =>
      Preference.setBool(KEY_IS_DARK, isDark);

  @override
  Future<String?> getUserName() async =>
      await Preference.getSecuredString(KEY_USER_NAME);

  @override
  Future<void> setUserName(String userName) async =>
      await Preference.setSecuredString(KEY_USER_NAME, userName);

  @override
  Future<String?> getPassword() async =>
      await Preference.getSecuredString(KEY_PASSWORD);

  @override
  Future<void> setPassword(String password) async =>
      await Preference.setSecuredString(KEY_PASSWORD, password);

  @override
  bool getIsUserLoggedIn() => Preference.getBool(KEY_IS_USER_LOGGED_IN, false);

  @override
  Future<void> setIsUserLoggedIn(bool isUserLoggedIn) async =>
      await Preference.setBool(KEY_IS_USER_LOGGED_IN, isUserLoggedIn);

  @override
  Future<void> setPublicToken(String value) async =>
      await Preference.setSecuredString(KEY_PUBLIC_TOKEN, value);

  @override
  Future<String?> getPublicToken() async =>
      await Preference.getSecuredString(KEY_PUBLIC_TOKEN);

  @override
  Future<void> setUserToken(String value) async =>
      await Preference.setSecuredString(KEY_USER_TOKEN, value);

  @override
  Future<String?> getUserToken() async =>
      await Preference.getSecuredString(KEY_USER_TOKEN);
}
