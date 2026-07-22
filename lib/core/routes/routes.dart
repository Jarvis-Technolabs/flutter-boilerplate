import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/features/dashboard/dashboard_page.dart';
import 'package:flutter_clean_architecture/features/delete_account/delete_account_page.dart';
import 'package:flutter_clean_architecture/features/forgot_password/forgot_password_page.dart';
import 'package:flutter_clean_architecture/features/jail_break/screen/jail_break_screen.dart';
import 'package:flutter_clean_architecture/features/login/login_page.dart';
import 'package:flutter_clean_architecture/features/splash/presentation/splash_page.dart';
import 'package:logger/logger.dart';

import '../di/injection_container.dart';

Logger logger = sl();

class RouteAnalyticsArguments {
  final dynamic arguments;
  final String? screenName;

  const RouteAnalyticsArguments({
    this.arguments,
    this.screenName,
  });
}

dynamic getRouteArguments(dynamic arguments) {
  if (arguments is RouteAnalyticsArguments) {
    return arguments.arguments;
  }
  return arguments;
}

String formatAnalyticsScreenName(String value) {
  String name = value.trim();

  if (name.isEmpty) return name;

  name = name.replaceAll(RegExp(r'\d+$'), '');
  name = name.replaceAll(RegExp(r'(Page|Screen)$'), '');
  name = name.replaceAll(RegExp(r'\d+$'), '');
  name = name.replaceAll('_', ' ');
  name = name.replaceAll('-', ' ');
  name = name.replaceAllMapped(
    RegExp(r'(?<=[a-z])(?=[A-Z])'),
    (_) => ' ',
  );
  name = name.replaceAll(RegExp(r'\s+'), ' ').trim();

  if (name.isEmpty) return value.trim();

  return name
      .split(' ')
      .where((word) => word.isNotEmpty)
      .map(
        (word) => word[0].toUpperCase() + word.substring(1).toLowerCase(),
      )
      .join(' ');
}

class Routes {
  static const String splash = 'splash';
  static const String jailBreakScreen = 'jailBreakScreen';
  static const String loginPage = 'loginPage';
  static const String forgotPasswordPage = 'forgotPasswordPage';
  static const String dashboard = 'dashboard';
  static const String deleteAccountPage = 'deleteAccountPage';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashPage(),
    jailBreakScreen: (BuildContext context) => JailBreakScreen(),
    loginPage: (BuildContext context) => LoginPage(),
    forgotPasswordPage: (BuildContext context) => ForgotPasswordPage(),
    dashboard: (BuildContext context) => DashboardPage(),
    deleteAccountPage: (BuildContext context) => DeleteAccountPage(),
  };
}

/// use this method to navigate screen with route name
Future<dynamic> navigateTo(
  BuildContext context,
  String routeName, {
  dynamic arguments,
  String? screenName,
}) async {
  try {
    logger.v("navigateTo " + routeName);
    return await Navigator.pushNamed(
      context,
      routeName,
      arguments:
          (screenName != null && screenName.trim().isNotEmpty)
              ? RouteAnalyticsArguments(
                  arguments: arguments,
                  screenName: screenName,
                )
              : arguments,
    );
  } catch (e) {
    logger.e("navigateTo Exception: " + e.toString());
  }
}

/// use this method to pop screen as well as set result for that screen
void goBack(
  BuildContext context, {
  String? route,
  dynamic result,
}) {
  try {
    var string = "";
    string += "route= ${route ?? ""}";
    string += " result= ${result ?? ""}";
    if (string.isNotEmpty) logger.v("goBack " + string);
    return Navigator.pop(context, result);
  } catch (e) {
    logger.e("goBack Exception: " + e.toString());
  }
}

/// use this method to navigate screen with clear back screens adding routename as well as route widget
Future<dynamic> navigateWithRemoveUntil({
  required BuildContext context,
  required String routeName,
  required Widget route,
  String? screenName,
}) async {
  try {
    var string = "";
    string += "routeName= $routeName";
    string += " route= $route";
    if (string.isNotEmpty) logger.v("navigateWithRemoveUntil " + string);
    return await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => route,
        settings: RouteSettings(
          name: getScreenName(route, screenName: screenName),
        ),
      ),
      ModalRoute.withName(routeName),
    );
  } catch (e) {
    logger.e("navigateWithRemoveUntil Exception: " + e.toString());
  }
}

/// use this method to navigate the screen and remove all the previous screens
Future<dynamic> navigateAndRemoveAll({
  required BuildContext context,
  required String routeName,
  required Widget route,
  String? screenName,
}) async {
  try {
    var string = "";
    string += "routeName= $routeName";
    string += " route= $route";
    if (string.isNotEmpty) logger.v("navigateWithRemoveUntil " + string);
    return await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => route,
        settings: RouteSettings(
          name: getScreenName(
            route,
            screenName: screenName,
          ),
        ),
      ),
      (Route<dynamic> route) => false,
    );
  } catch (e) {
    logger.e("navigateWithRemoveUntil Exception: " + e.toString());
  }
}

/// use this method to navigate screen with push any widget
Future<dynamic> navigatePush(
  BuildContext context,
  Widget route, {
  bool? fullscreenDialog,
  String? screenName,
}) async {
  try {
    var string = "";
    string += "route= $route";
    string += " fullscreenDialog= $fullscreenDialog";
    if (string.isNotEmpty) logger.v("navigatePush " + string);
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => route,
        settings: RouteSettings(
          name: getScreenName(route, screenName: screenName),
        ),
        fullscreenDialog:
            ((fullscreenDialog == null) ? false : fullscreenDialog),
      ),
    );
  } catch (e) {
    logger.e("navigatePush Exception: " + e.toString());
  }
}

/// use this method to navigate screen with root navigator and passing route
Future<dynamic> navigatePushRootNavigator(
  BuildContext context,
  bool rootNavigator,
  Route route,
) async {
  try {
    var string = "";
    string += "rootNavigator= $rootNavigator";
    string += " route= $route";
    if (string.isNotEmpty) logger.v("navigatePushRootNavigator " + string);
    return await Navigator.of(context, rootNavigator: rootNavigator)
        .push(route);
  } catch (e) {
    logger.e("navigatePushRootNavigator Exception: " + e.toString());
  }
}

/// use this method to navigate screen with replacement passing widget
Future<dynamic> navigatePushReplacement(
  BuildContext context,
  Widget route,
  String? screenName,
) async {
  try {
    logger.v("navigatePushReplacement " + route.toString());
    return await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => route,
        settings: RouteSettings(
          name: getScreenName(route, screenName: screenName),
        ),
      ),
    );
  } catch (e) {
    logger.e("navigatePushReplacement Exception: " + e.toString());
  }
}

/// use this method to navigate screen with named replacement
Future<dynamic> navigatePushReplacementWithName(
  BuildContext context,
  String routeName, {
  dynamic arguments,
  String? screenName,
}
) async {
  try {
    logger.v("navigatePushReplacement " + routeName.toString());
    return await Navigator.pushReplacementNamed(
      context,
      routeName,
      arguments:
          (screenName != null && screenName.trim().isNotEmpty)
              ? RouteAnalyticsArguments(
                  arguments: arguments,
                  screenName: screenName,
                )
              : arguments,
    );
  } catch (e) {
    logger.e("navigatePushReplacement Exception: " + e.toString());
  }
}

/// use this method to navigate screen with bottom navigation
Future<dynamic> pushWithNavigator(
  NavigatorState navigatorState,
  Widget route,
  String? screenName,
) async {
  try {
    bool isCurrentRouteNull = false;
    navigatorState.popUntil(
      (route) {
        if (route.settings.name == null) {
          isCurrentRouteNull = true;
        }
        return true;
      },
    );

    if (isCurrentRouteNull) {
      return await navigatorState.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => route,
          settings: RouteSettings(
            name: getScreenName(route, screenName: screenName),
          ),
        ),
        (route) {
          if (route.settings.name == "/") {
            return true;
          }
          return false;
        },
      );
    } else {
      return await navigatorState.push(
        MaterialPageRoute(
          builder: (context) => route,
          settings: RouteSettings(
            name: getScreenName(route, screenName: screenName),
          ),
        ),
      );
    }
  } catch (e) {
    logger.e("pushWithNavigator Exception: " + e.toString());
  }
}

/// Close App
Future<dynamic> closeApp() async {
  try {
    logger.v("Close App");
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  } catch (e) {
    logger.e("Close App Exception: " + e.toString());
  }
}

String getScreenName(
  Widget page, {
  String? screenName,
}) {
  if (screenName != null && screenName.trim().isNotEmpty) {
    return formatAnalyticsScreenName(screenName);
  }

  String name = page.runtimeType.toString();
  return formatAnalyticsScreenName(name);
}
