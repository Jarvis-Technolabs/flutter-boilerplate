import 'dart:async';

import 'package:easy_alert/easy_alert.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/util/injection_container.dart'
    as di;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

import 'core/preference/PrefConstants.dart';
import 'core/preference/Prefs.dart';
import 'core/util/AppConstants.dart';
import 'core/util/FlavorConfig.dart';
import 'core/util/injection_container.dart';
import 'core/util/internationalization/local/AppLocalizations.dart';
import 'features/feed/presentation/bloc/authentication_bloc.dart';
import 'features/feed/presentation/screens/FeedsPage.dart';
import 'features/login/presentation/screens/LoginPage.dart';

void mainDelegate() async {
  await Prefs.init();
  await di.init();
  Crashlytics.instance.enableInDevMode = false;
  FlutterError.onError = (FlutterErrorDetails details) {
    Crashlytics.instance.recordFlutterError(details);
  };
  var appTheme = Prefs.getString(KEY_APP_THEME);
  runZoned<Future<void>>(() async {
    runApp(AlertProvider(
        config: AlertConfig(),
        child: BlocProvider<AuthenticationBloc>(
          builder: (context) => sl(),
          child: MyApp(
            appTheme: appTheme,
          ),
        )));
  }, onError: Crashlytics.instance.recordError);
}

class MyApp extends StatefulWidget {
  String appTheme;

  MyApp({Key key, this.appTheme}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  MaterialColor primarySwatch = Colors.blue;

  void initState() {
    super.initState();
    changePrimarySwatch(widget?.appTheme);
  }

  @override
  Widget build(BuildContext context) {
    Stetho.initialize();

    print("Current flavor " + FlavorConfig.instance.flavor.toString());
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale('en')],
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: primarySwatch, fontFamily: 'SourceSansPro'),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/SignIn': (BuildContext context) => FeedsPage(),
      }, //Dashboard,MajalisCalendar
    );
  }

  void changePrimarySwatch(String appTheme) {
    setState(() {
      if (appTheme == GREEN) {
        primarySwatch = Colors.teal;
      } else if (appTheme == BLUE_DARK) {
        primarySwatch = Colors.indigo;
      } else {
        primarySwatch = Colors.blue;
      }
    });
  }
}
