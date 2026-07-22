import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../di/injection_container.dart';

class ScreenNavigationLogger extends NavigatorObserver {
  Logger logger = sl();

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    try {
      String string = "";

      if (route.settings.name != null)
        string += "route = " + route.settings.name!;
      if (previousRoute != null && previousRoute.settings.name != null)
        string += " previousRoute = " + previousRoute.settings.name!;

      if (string.isNotEmpty) logger.v("didPop " + string);
    } catch (e) {
      logger.e("didPop ex " + e.toString());
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    try {
      String string = "";
      if (route.settings.name != null)
        string += "route = " + route.settings.name!;
      if (previousRoute != null && previousRoute.settings.name != null)
        string += " previousRoute = " + previousRoute.settings.name!;
      if (string.isNotEmpty) logger.v("didPush " + string);
    } catch (e) {
      logger.e("didPush ex " + e.toString());
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    try {
      String string = "";

      if (route.settings.name != null)
        string += "route = " + route.settings.name!;
      if (previousRoute != null && previousRoute.settings.name != null)
        string += " previousRoute = " + previousRoute.settings.name!;

      if (string.isNotEmpty) logger.v("didRemove " + string);
    } catch (e) {
      logger.e("didRemove ex " + e.toString());
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    try {
      String string = "";

      if (newRoute != null && newRoute.settings.name != null)
        string += "route = " + newRoute.settings.name!;
      if (oldRoute != null && oldRoute.settings.name != null)
        string += " previousRoute = " + oldRoute.settings.name!;

      if (string.isNotEmpty) logger.v("didReplace " + string);
    } catch (e) {
      logger.e("didReplace ex " + e.toString());
    }
  }
}
