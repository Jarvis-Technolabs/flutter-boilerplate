import 'dart:async';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:device_preview/device_preview.dart';
import 'package:example_app/core/flavour/flavour_config.dart';
import 'package:example_app/core/util/common_utilities.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/app_configuration_bloc/app_configuration_bloc.dart';
import 'core/app_configuration_bloc/app_configuration_state.dart';
import 'core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'core/const/app_constants.dart';
import 'core/crashlytics_config/crashlytics_config.dart';
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
      if (kReleaseMode) {
        await FirebaseCrashlytics.instance
            .setCrashlyticsCollectionEnabled(true);
        await FirebaseCrashlytics.instance;
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);
        await CrashlyticsConfig.setCrashlyticsData();
      }
      ///TODO: If you need Chucker Flutter library instead of storing API logs in a text file.
/*        if(FlavourConfig.isStaging() || FlavourConfig.isDev()){
        ChuckerFlutter.configure(
          showOnRelease: true,
          showNotification: false,
        );
      }*/
      FlutterError.onError = (FlutterErrorDetails details) {
        FirebaseCrashlytics.instance.recordFlutterError(details);
      };

      FirebaseMessaging.instance.requestPermission();

      ///Set portrait mode
      await SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      );
      await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
      runApp(
        DevicePreview(
          enabled: ENABLE_DEVICE_PREVIEW,
          builder: (BuildContext context) => MultiBlocProvider(
            providers: [
              /// provide AppConfigurationBloc
              BlocProvider<AppConfigurationBloc>(
                create: (context) => sl(),
              ),

              /// provide ApiBaseBloc
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
      FirebaseCrashlytics.instance.recordError(object, stackTrace);
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    deepLinkStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AppConfigurationBloc, AppConfigurationState>(
        builder: (BuildContext context, AppConfigurationState state) =>

            /// AppConfigurationBloc refresh the MaterialApp based on language change and theme change
        MaterialApp(
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          themeMode: ThemeMode.light, // set initial theme mode
          debugShowCheckedModeBanner: false,
          supportedLocales: [Locale('en'), Locale('es')], // setSupportedLocals
          /// initialize localizationsDelegates
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],

          /// set current local from the sharedPreference
          locale: Locale(preferenceHelper.getLanguage()),

          /// setLight theme
          theme: ThemeUtil.getLightTheme(
            context: context,
            appColors: getAppColors(),
          ),

          /// set dark theme
          darkTheme: ThemeUtil.getDarkTheme(
            context: context,
            appColors: getAppColors(),
          ),
          initialRoute: preferenceHelper.getIsUserLoggedIn()?Routes.examplePage:Routes.signUpBasicFormPage,
          routes: Routes.routes,
          navigatorObservers: [ScreenNavigationLogger()],
        ),
      );

  /// get Colors as per the selected theme
  ColorsInf getAppColors() =>
      preferenceHelper.getIsDarkTheme() ? ColorsDark() : ColorsLight();
}
