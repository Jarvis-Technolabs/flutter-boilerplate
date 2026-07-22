import 'dart:async';
import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/crashlytics_config/crashlytics_config.dart';
import 'package:flutter_clean_architecture/core/flavour/flavour_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/app_configuration_bloc/app_configuration_bloc.dart';
import 'core/app_configuration_bloc/app_configuration_state.dart';
import 'core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'core/const/app_constants.dart';
import 'core/di/injection_container.dart' as di;
import 'core/di/injection_container.dart';
import 'core/localizations/app_localizations.dart';
import 'core/preference/preference.dart';
import 'core/preference/preference_helper.dart';
import 'core/routes/routes.dart';
import 'core/routes/screen_navigation_logger.dart';
import 'core/ui/theme/colors/colors_dark.dart';
import 'core/ui/theme/colors/colors_inf.dart';
import 'core/ui/theme/colors/colors_light.dart';
import 'core/ui/theme/theme_util/theme_util.dart';

void mainDelegate() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Preference.init();
      await di.init();

      await Firebase.initializeApp();
      await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
      if (kReleaseMode) {
        await FirebaseCrashlytics.instance
            .setCrashlyticsCollectionEnabled(true);
        await FirebaseCrashlytics.instance;
        await CrashlyticsConfig.setCrashlyticsData();
      }
      ///TODO: If you need Chucker Flutter library instead of storing API logs in a text file.
      if(FlavourConfig.isStaging() || FlavourConfig.isDev()){
        ChuckerFlutter.configure(
          showOnRelease: true,
          showNotification: false,
        );
      }
      FlutterError.onError = (FlutterErrorDetails details) {
        if (Firebase.apps.isNotEmpty) {
          FirebaseCrashlytics.instance.recordFlutterError(details);
        } else {
          FlutterError.dumpErrorToConsole(details);
        }
      };
      FirebaseMessaging.instance.requestPermission();

      ///Set portrait mode
      await SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      );

      runApp(
        DevicePreview(
          enabled: ENABLE_DEVICE_PREVIEW,
          builder: (BuildContext context) => MultiBlocProvider(
            providers: [
              BlocProvider<AppConfigurationBloc>(
                create: (context) => sl(),
              ),
              BlocProvider<ApiBaseBloc>(
                create: (context) => sl(),
              ),
            ],
            child: MyApp(),
          ),
        ),
      );
    },
    (object, stackTrace) {
      if (Firebase.apps.isNotEmpty) {
        FirebaseCrashlytics.instance.recordError(object, stackTrace);
      } else {
        debugPrint(object.toString());
        debugPrintStack(stackTrace: stackTrace);
      }
    },
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  PreferenceHelper preferenceHelper = sl();
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  //TODO: If the application launch screen contains an animated GIF or Lottie animation, then Flutter Splash MUST be enabled this flag isShowAnimatedSplashForIOS = true for iOS.
  bool isShowAnimatedSplashForIOS = false;
  bool isFlutterSplashEnableForIOS = false;

  @override
  void initState() {
    isFlutterSplashEnableForIOS =
        Platform.isIOS ? isShowAnimatedSplashForIOS : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AppConfigurationBloc, AppConfigurationState>(
        builder: (
          BuildContext context,
          AppConfigurationState state,
        ) =>
            MaterialApp(
          navigatorKey: ChuckerFlutter.navigatorKey,
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          supportedLocales: [Locale('en')],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          locale: Locale(preferenceHelper.getLanguage()),
          theme: ThemeUtil.getLightTheme(
            context: context,
            appColors: getAppColors(),
          ),
          darkTheme: ThemeUtil.getDarkTheme(
            context: context,
            appColors: getAppColors(),
          ),

          /// TODO - Update routes based on login state of user
          initialRoute: isFlutterSplashEnableForIOS
              ? Routes.splash
              : Routes.splash,
          routes: Routes.routes,
          navigatorObservers: [
            ScreenNavigationLogger(),
            FirebaseAnalyticsObserver(
              analytics: analytics,
              routeFilter: (Route<dynamic>? route) => route is PageRoute,
              nameExtractor: (RouteSettings settings) {
                if (settings.arguments is RouteAnalyticsArguments) {
                  final String? customScreenName =
                      (settings.arguments as RouteAnalyticsArguments)
                          .screenName
                          ?.trim();
                  if (customScreenName != null &&
                      customScreenName.isNotEmpty) {
                    return formatAnalyticsScreenName(customScreenName);
                  }
                }

                final String? routeName = settings.name?.trim();
                if (routeName == null || routeName.isEmpty) {
                  return null;
                }
                return formatAnalyticsScreenName(routeName);
              },
            ),
          ],
        ),
      );

  ColorsInf getAppColors() =>
      preferenceHelper.getIsDarkTheme() ? ColorsDark() : ColorsLight();
}
