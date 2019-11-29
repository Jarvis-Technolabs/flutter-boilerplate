import 'PrefConstants.dart';
import 'PrefHelper.dart';
import 'Prefs.dart';

import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class PrefHelperImpl implements PrefHelper {
  Future<StreamingSharedPreferences> initializePref() async =>
      await StreamingSharedPreferences.instance;

  @override
  String getDeviceId() => Prefs.getString(KEY_DEVICE_ID);

  @override
  void setDeviceId(String deviceId) => Prefs.setString(KEY_DEVICE_ID, deviceId);

  @override
  String getFCMId() => Prefs.getString(KEY_FCM_ID);

  @override
  void setFCMId(String fcmId) => Prefs.setString(KEY_FCM_ID, fcmId);

  @override
  String getCountryCode() => Prefs.getString(KEY_COUNTRY_CODE);

  @override
  String getCountryName() => Prefs.getString(KEY_COUNTRY_NAME);

  @override
  String getDeviceToken() => Prefs.getString(KEY_DEVICE_TOKEN);

  @override
  String getEmail() => Prefs.getString(KEY_EMAIL);

  @override
  String getFirstName() => Prefs.getString(KEY_FIRSTNAME);

  @override
  String getLastName() => Prefs.getString(KEY_LASTNAME);

  @override
  String getMembershipNumber() => Prefs.getString(KEY_MEMBERSHIP_NUMBER);

  @override
  String getMobileNumber() => Prefs.getString(KEY_MOBILE_NO);

  @override
  void setCountryCode(String countryCode) =>
      Prefs.setString(KEY_COUNTRY_CODE, countryCode);

  @override
  void setCountryName(String countryName) =>
      Prefs.setString(KEY_COUNTRY_NAME, countryName);

  @override
  void setDeviceToken(String deviceToken) =>
      Prefs.setString(KEY_DEVICE_TOKEN, deviceToken);

  @override
  void setEmail(String email) => Prefs.setString(KEY_EMAIL, email);

  @override
  void setFirstName(String firstName) =>
      Prefs.setString(KEY_FIRSTNAME, firstName);

  @override
  void setLastName(String lastName) => Prefs.setString(KEY_LASTNAME, lastName);

  @override
  void setMembershipNumber(String membershipNumber) =>
      Prefs.setString(KEY_MEMBERSHIP_NUMBER, membershipNumber);

  @override
  void setMobileNumber(String mobileNumber) =>
      Prefs.setString(KEY_MOBILE_NO, mobileNumber);

  @override
  String getAuthenticationToken() => Prefs.getString(KEY_AUTHENTICATION_TOKEN);

  @override
  int getIsMulakat() => Prefs.getInt(KEY_IS_MULAKAT);

  @override
  bool getIsShowDarbarAgegroupReport() =>
      Prefs.getBool(KEY_SHOW_DARBAR_AGEGROUPREPORT);

  @override
  bool getIsShowSchoolManagement() => Prefs.getBool(KEY_SHOW_SCHOOL_MANAGEMENT);

  @override
  void setIsShowSchoolManagement(bool status) =>
      Prefs.setBool(KEY_SHOW_SCHOOL_MANAGEMENT, status);

  @override
  bool getIsShowDarbarCountryCityReport() =>
      Prefs.getBool(KEY_SHOW_DARBAR_COUNTRYCITYREPORT);

  @override
  bool getIsShowDarbarHallCheckOut() =>
      Prefs.getBool(KEY_SHOW_DARBAR_HALLCHECKOUT);

  @override
  bool getIsShowDarbarHallCheckin() =>
      Prefs.getBool(KEY_SHOW_DARBAR_HALLCHECKIN);

  @override
  bool getIsShowDarbarInternationAgegroupReport() =>
      Prefs.getBool(KEY_SHOW_DARBAR_INTERNATIONAGEGROUPREPORT);

  @override
  bool getIsShowDarbarInternationCountryCityReport() =>
      Prefs.getBool(KEY_SHOW_DARBAR_INTERNATIONCOUNTRYCITYREPORT);

  @override
  bool getIsShowDarbarRegistrationReport() =>
      Prefs.getBool(KEY_SHOW_DARBAR_REGISTRATIONREPORT);

  @override
  bool getIsShowLoungeCheckIn() => Prefs.getBool(KEY_SHOW_LOUNGE_CHECKIN);

  @override
  String getPassword() => Prefs.getString(KEY_PASSWORD);

  @override
  bool getUserLoggedIn() => Prefs.getBool(KEY_USER_LOGGED_IN);

  @override
  void setAuthenticationToken(String authenticationToken) =>
      Prefs.setString(KEY_AUTHENTICATION_TOKEN, authenticationToken);

  @override
  void setIsMulakat(int isMulakat) => Prefs.setInt(KEY_IS_MULAKAT, isMulakat);

  @override
  void setIsShowDarbarAgegroupReport(bool status) =>
      Prefs.setBool(KEY_SHOW_DARBAR_AGEGROUPREPORT, status);

  @override
  void setIsShowDarbarCountryCityReport(bool status) =>
      Prefs.setBool(KEY_SHOW_DARBAR_COUNTRYCITYREPORT, status);

  @override
  void setIsShowDarbarHallCheckOut(bool status) =>
      Prefs.setBool(KEY_SHOW_DARBAR_HALLCHECKOUT, status);

  @override
  void setIsShowDarbarHallCheckin(bool status) =>
      Prefs.setBool(KEY_SHOW_DARBAR_HALLCHECKIN, status);

  @override
  void setIsShowDarbarInternationAgegroupReport(bool status) =>
      Prefs.setBool(KEY_SHOW_DARBAR_INTERNATIONAGEGROUPREPORT, status);

  @override
  void setIsShowDarbarInternationCountryCityReport(bool status) =>
      Prefs.setBool(KEY_SHOW_DARBAR_INTERNATIONCOUNTRYCITYREPORT, status);

  @override
  void setIsShowDarbarRegistrationReport(bool status) =>
      Prefs.setBool(KEY_SHOW_DARBAR_REGISTRATIONREPORT, status);

  @override
  void setIsShowLoungeCheckIn(bool status) =>
      Prefs.setBool(KEY_SHOW_LOUNGE_CHECKIN, status);

  @override
  void setPassword(String password) => Prefs.setString(KEY_PASSWORD, password);

  @override
  void setUserLoggedIn(bool status) =>
      Prefs.setBool(KEY_USER_LOGGED_IN, status);



  @override
  String getCityName() => Prefs.getString(KEY_CITY_NAME);

  @override
  void setCityName(String cityName) => Prefs.setString(KEY_CITY_NAME, cityName);

  @override
  int getAppUpdateDelayedTime() => Prefs.getInt(KEY_APP_UPDATE_DELAYED_TIME);

  @override
  void setAppUpdateDelayedTime(int appUpdateDelayedTime) =>
      Prefs.setInt(KEY_APP_UPDATE_DELAYED_TIME, appUpdateDelayedTime);

  @override
  String getAppTheme() => Prefs.getString(KEY_APP_THEME);

  @override
  void setAppTheme(String appTheme) => Prefs.setString(KEY_APP_THEME, appTheme);

  @override
  int getSchoolId() => Prefs.getInt(KEY_SCHOOL_ID);

  @override
  void setSchoolId(int schoolId) => Prefs.setInt(KEY_SCHOOL_ID, schoolId);

  @override
  bool getPermissionAskedForMajalisCalendar() =>
      Prefs.getBool(KEY_PERMISSION_ASKED_FOR_MAJALIS_CAL);

  @override
  bool getPermissionAskedForNormalCalendar() =>
      Prefs.getBool(KEY_PERMISSION_ASKED_FOR_NORMAL_CAL);

  @override
  void setPermissionAskedForMajalisCalendar(
          bool permissionAskedForMajalisCalendar) =>
      Prefs.setBool(KEY_PERMISSION_ASKED_FOR_MAJALIS_CAL,
          permissionAskedForMajalisCalendar);

  @override
  void setPermissionAskedForNormalCalendar(
          bool permissionAskedForNormalCalendar) =>
      Prefs.setBool(KEY_PERMISSION_ASKED_FOR_NORMAL_CAL,
          permissionAskedForNormalCalendar);


}
