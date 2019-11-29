mixin BaseView {


  void showErrorDialog(String errorMessage);

  void setAppTheme(String appTheme);

  void unauthenticated();

  void showToast(String message);

  void openDashboardScreen();

  void serverError();

  void checkInternetConnectionError();

  void showMessageArrivedMessage();

  String getAppThemeFromPref();

  void autoLoginUser();
}
