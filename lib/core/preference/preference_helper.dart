abstract class PreferenceHelper {
  Future<void> clearAllPrefData();

  String getLanguage();

  Future<bool> setLanguage(String value);

  Future<bool> setIsDarkTheme(bool isDark);

  bool getIsDarkTheme();

  Future<String?> getUserName();

  Future<void> setUserName(String value);

  Future<String?> getMobileNo();

  Future<void> setMobileNo(String value);

  bool getIsUserLoggedIn();

  Future<void> setIsUserLoggedIn(bool value);

  Future<void> setPublicToken(String value);

  Future<String?> getPublicToken();

  Future<void> setUserToken(String value);

  Future<String?> getUserToken();
}
