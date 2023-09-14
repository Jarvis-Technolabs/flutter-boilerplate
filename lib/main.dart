import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  await Preference.init();
  await di.init();

  ///Todo: Uncomment after firebase setup
  // await Firebase.initializeApp();
  // if (kReleaseMode) {
  //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  //   await FirebaseCrashlytics.instance;
  //   await CrashlyticsConfig.setCrashlyticsData();
  // }
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FirebaseCrashlytics.instance.recordFlutterError(details);
  // };

  ///Set portrait mode
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runZonedGuarded(
    () async => runApp(
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
    ),
    (object, stackTrace) {
      ///Todo: Uncomment after firebase setup
      //FirebaseCrashlytics.instance.recordError(object, stackTrace);
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
  Widget build(BuildContext context) =>
      BlocBuilder<AppConfigurationBloc, AppConfigurationState>(
        builder: (BuildContext context, AppConfigurationState state) =>
            MaterialApp(
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
          initialRoute: Routes.splash,
          routes: Routes.routes,
          navigatorObservers: [ScreenNavigationLogger()],
        ),
      );

  ColorsInf getAppColors() =>
      preferenceHelper.getIsDarkTheme() ? ColorsDark() : ColorsLight();
}
