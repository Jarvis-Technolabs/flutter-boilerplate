import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

abstract class PrefHelper {
  Future<StreamingSharedPreferences> initializePref();

  String getDeviceId();

  void setDeviceId(String deviceId);

  String getFCMId();

  void setFCMId(String fcmId);

  String getFirstName();

  void setFirstName(String firstName);

  String getLastName();

  void setLastName(String lastName);

  String getDeviceToken();

  void setDeviceToken(String deviceToken);

  String getMobileNumber();

  void setMobileNumber(String mobileNumber);

  String getCountryCode();

  void setCountryCode(String countryCode);

  String getEmail();

  void setEmail(String email);

  void setCityName(String cityName);

  String getCityName();

  String getCountryName();

  void setCountryName(String countryName);

  String getMembershipNumber();

  void setMembershipNumber(String membershipNumber);

  String getPassword();

  void setPassword(String password);

  String getAuthenticationToken();

  void setAuthenticationToken(String authenticationToken);

  int getIsMulakat();

  void setIsMulakat(int isMulakat);

  bool getUserLoggedIn();

  void setUserLoggedIn(bool status);

  bool getIsShowDarbarCountryCityReport();

  void setIsShowDarbarCountryCityReport(bool status);

  bool getIsShowDarbarAgegroupReport();

  void setIsShowDarbarAgegroupReport(bool status);

  bool getIsShowSchoolManagement();

  void setIsShowSchoolManagement(bool status);

  bool getIsShowDarbarHallCheckOut();

  void setIsShowDarbarHallCheckOut(bool status);

  bool getIsShowDarbarHallCheckin();

  void setIsShowDarbarHallCheckin(bool status);

  bool getIsShowDarbarInternationAgegroupReport();

  void setIsShowDarbarInternationAgegroupReport(bool status);

  bool getIsShowDarbarInternationCountryCityReport();

  void setIsShowDarbarInternationCountryCityReport(bool status);

  bool getIsShowDarbarRegistrationReport();

  void setIsShowDarbarRegistrationReport(bool status);

  bool getIsShowLoungeCheckIn();

  void setIsShowLoungeCheckIn(bool status);

  int getAppUpdateDelayedTime();

  void setAppUpdateDelayedTime(int appUpdateDelayedTime);

  String getAppTheme();

  void setAppTheme(String appTheme);

  int getSchoolId();

  void setSchoolId(int schoolId);

  void setPermissionAskedForNormalCalendar(
      bool permissionAskedForNormalCalendar);

  bool getPermissionAskedForNormalCalendar();

  void setPermissionAskedForMajalisCalendar(
      bool permissionAskedForMajalisCalendar);

  bool getPermissionAskedForMajalisCalendar();
}
