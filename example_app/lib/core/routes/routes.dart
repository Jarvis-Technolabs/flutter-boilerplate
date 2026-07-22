import 'package:example_app/features/animated_introduction/animated_intro_page.dart';
import 'package:example_app/features/animated_search_bar/animated_search_bar_page.dart';
import 'package:example_app/features/app_theme/app_theme_change_page.dart';
import 'package:example_app/features/chat_gpt_introduction/ghat_gpt_intro_page.dart';
import 'package:example_app/features/custom_loader/custom_loader_page.dart';
import 'package:example_app/features/get_api/presentation/get_api_page.dart';
import 'package:example_app/features/google_map/presentation/google_map_example_page.dart';
import 'package:example_app/features/image_and_file_picker/screen/image_and_file_picker_screen.dart';
import 'package:example_app/features/jail_break/screen/jail_break_screen.dart';
import 'package:example_app/features/pagination_with_delete/pagination_delete_page.dart';
import 'package:example_app/features/sensitive_info/sensitive_info_page.dart';
import 'package:example_app/features/share/presentation/share_example_screen.dart';
import 'package:example_app/features/sign_up/sign_up_basic_form_page.dart';
import 'package:example_app/features/splash/presentation/splash_page.dart';
import 'package:example_app/features/webview/presentation/webview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../../features/accessibility/accessibility_page.dart';
import '../../features/app_language/change_language_page.dart';
import '../../features/bottom_navigation_bar/presentation/bottom_navigation_bar_page.dart';
import '../../features/custom_progress_indicator/presentation/custom_progress_indicator_page.dart';
import '../../features/email_mobile_textview/email_mobile_textview_page.dart';
import '../../features/examples/presentation/example_page.dart';
import '../../features/file_download/screen/file_download_example_screen.dart';
import '../../features/firebase_phone_auth/presentation/firebase_phone_authentication_page.dart';
import '../../features/local_database_example/presentation/example_local_database_page.dart';
import '../../features/lottie_image/presentation/screen/lottie_image_example_screen.dart';
import '../../features/overlay_widget_example/presentation/overlay_widgets_example_screen.dart';
import '../../features/social_login/presentation/social_login_page.dart';
import '../../features/touch_face_auth/presentation/screen/touch_and_face_auth_screen.dart';
import '../di/injection_container.dart';

Logger logger = sl();

class Routes {
  Routes._();

  static const String splash = 'splash';
  static const String jailBreakScreen = 'jailBreakScreen';
  static const String examplePage = 'examplePage';
  static const String signUpBasicFormPage = 'signUpBasicFormPage';
  static const String getApiPage = 'getApiPage';
  static const String changeAppThemePage = 'changeAppThemePage';
  static const String changeLanguagePage = 'changeLanguagePage';
  static const String imageAndFilePickerPage = 'imageAndFilePickerPage';
  static const String lottieImageExampleScreen = 'lottieImageExampleScreen';
  static const String localDatabaseExamplePage = 'localDatabaseExamplePage';
  static const String webViewPage = 'webViewPage';
  static const String shareExampleScreen = 'shareExampleScreen';
  static const String bottomNavigationBarExamplePage =
      'bottomNavigationBarExamplePage';
  static const String socialLoginPage = 'socialLoginPage';
  static const String firebasePhoneAuthPage = 'firebasePhoneAuthPage';
  static const String fileDownloadExamplePage = 'fileDownloadExamplePage';
  static const String overlayWidgetExampleScreen = 'overlayWidgetExampleScreen';
  static const String googleMapExampleScreen = 'googleMapExampleScreen';
  static const String animatedSearchBar = 'animatedSearchBar';
  static const String customProgressIndicator = 'customProgressIndicator';
  static const String touchAndFaceIdAuthScreen = 'touchAndFaceIdAuthScreen';
  static const String customEmailMobileTextView = 'customEmailMobileTextView';
  static const String customLoader = 'customLoader';
  static const String sensitiveInfo = "sensitiveInfo";
  static const String paginationWithDelete = 'paginationWithDelete';
  static const String animatedIntro = "animatedIntroduction";
  static const String chatGPTIntro = "chatGPTIntro";
  static const String accessibility = "accessibility";

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashPage(),
    jailBreakScreen: (BuildContext context) => JailBreakScreen(),
    examplePage: (BuildContext context) => ExamplePage(),
    signUpBasicFormPage: (BuildContext context) => SignUpBasicFormPage(),
    getApiPage: (BuildContext context) => GetApiPage(),
    changeAppThemePage: (BuildContext context) => AppThemeChangePage(),
    changeLanguagePage: (BuildContext context) => ChangeLanguagePage(),
    imageAndFilePickerPage: (BuildContext context) =>
        ImageAndFilePickerScreen(),
    lottieImageExampleScreen: (BuildContext context) =>
        LottieImageExampleScreen(),
    localDatabaseExamplePage: (BuildContext context) =>
        ExampleLocalDataBasePage(),
    webViewPage: (BuildContext context) => WebViewPage(),
    shareExampleScreen: (BuildContext context) => ShareExampleScreen(),
    bottomNavigationBarExamplePage: (BuildContext context) =>
        BottomNavigationBarPage(),
    socialLoginPage: (BuildContext context) => SocialLoginPage(),
    firebasePhoneAuthPage: (BuildContext context) => FirebasePhoneAuthPage(),
    fileDownloadExamplePage: (BuildContext context) =>
        FileDownloadExampleScreen(),
    overlayWidgetExampleScreen: (BuildContext context) =>
        OverlayWidgetsExampleScreen(),
    googleMapExampleScreen: (BuildContext context) => GoogleMapExamplePage(),
    animatedSearchBar: (BuildContext context) => AnimatedSearchBarPage(),
    customProgressIndicator: (BuildContext context) =>
        CustomProgressIndicatorPage(),
    touchAndFaceIdAuthScreen: (BuildContext context) =>
        TouchAndFaceAuthScreen(),
    customEmailMobileTextView: (BuildContext context) =>
        EmailMobileTextviewPage(),
    customLoader: (BuildContext context) => CustomLoaderPage(),
    sensitiveInfo: (BuildContext context) => SensitiveInfoPage(),
    paginationWithDelete: (BuildContext context) => PaginationDeletePage(),
    animatedIntro: (BuildContext context) => AnimatedIntroPage(),
    chatGPTIntro: (BuildContext context) => ChatGPTIntroPage(),
    accessibility: (BuildContext context) => AccessibilityPage(),
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
