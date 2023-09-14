import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/features/jail_break/screen/jail_break_screen.dart';
import 'package:flutter_clean_architecture/features/splash/presentation/splash_page.dart';
import 'package:logger/logger.dart';

import '../di/injection_container.dart';

Logger logger = sl();

class Routes {
  static const String splash = 'splash';
  static const String jailBreakScreen = 'jailBreakScreen';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashPage(),
    jailBreakScreen: (BuildContext context) => JailBreakScreen(),
  };
}

/// use this method to navigate screen with route name
navigateTo(BuildContext context, String routeName) async {
  try {
    logger.v("navigateTo " + routeName);
    await Navigator.pushNamed(context, routeName);
  } catch (e) {
    logger.e("navigateTo Exception: " + e.toString());
  }
}

/// use this method to pop screen as well as set result for that screen
goBack(BuildContext context, {String? route, dynamic result}) {
  try {
    var string = "";
    string += "route= ${route ?? ""}";
    string += " result= ${result ?? ""}";
    if (string.isNotEmpty) logger.v("goBack " + string);
    Navigator.pop(context, result);
  } catch (e) {
    logger.e("goBack Exception: " + e.toString());
  }
}

/// use this method to navigate screen with clear back screens adding routename as well as route widget
navigateWithRemoveUntil(BuildContext context, String routeName, Widget route) {
  try {
    var string = "";
    string += "routeName= $routeName";
    string += " route= $route";
    if (string.isNotEmpty) logger.v("navigateWithRemoveUntil " + string);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => route),
        ModalRoute.withName(routeName));
  } catch (e) {
    logger.e("navigateWithRemoveUntil Exception: " + e.toString());
  }
}

/// use this method to navigate the screen and remove all the previous screens
navigateAndRemoveAll({
  required BuildContext context,
  required String routeName,
}) async {
  try {
    if (routeName.isNotEmpty) {
      logger.v("navigateAndRemoveAll routeName= $routeName  ");
      await Navigator.of(context).pushNamedAndRemoveUntil(
        routeName,
        (Route<dynamic> route) => false,
      );
    }
  } catch (e) {
    logger.e("navigateAndRemoveAll Exception: " + e.toString());
  }
}

/// use this method to navigate screen with push any widget
Future<dynamic> navigatePush(BuildContext context, Widget route,
    {bool? fullscreenDialog}) async {
  try {
    var string = "";
    string += "route= $route";
    string += " fullscreenDialog= $fullscreenDialog";
    if (string.isNotEmpty) logger.v("navigatePush " + string);
    return await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => route,
          fullscreenDialog:
              ((fullscreenDialog == null) ? false : fullscreenDialog)),
    );
  } catch (e) {
    logger.e("navigatePush Exception: " + e.toString());
  }
}

/// use this method to navigate screen with root navigator and passing route
Future<dynamic> navigatePushRootNavigator(
    BuildContext context, bool rootNavigator, Route route) async {
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
navigatePushReplacement(BuildContext context, Widget route) {
  try {
    logger.v("navigatePushReplacement " + route.toString());
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => route,
      ),
    );
  } catch (e) {
    logger.e("navigatePushReplacement Exception: " + e.toString());
  }
}

/// use this method to navigate screen with named replacement
navigatePushReplacementWithName(BuildContext context, String routeName) {
  try {
    logger.v("navigatePushReplacement " + routeName.toString());
    Navigator.pushReplacementNamed(
      context,
      routeName,
    );
  } catch (e) {
    logger.e("navigatePushReplacement Exception: " + e.toString());
  }
}

/// use this method to navigate screen with bottom navigation
Future<dynamic> pushWithNavigator(
    NavigatorState navigatorState, Widget route) async {
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
        ),
      );
    }
  } catch (e) {
    logger.e("pushWithNavigator Exception: " + e.toString());
  }
}

/// Close App
closeApp() {
  try {
    logger.v("Close App");
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  } catch (e) {
    logger.e("Close App Exception: " + e.toString());
  }
}
