import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/colors/ColorsBlue.dart';
import 'package:flutter_clean_architecture/core/colors/ColorsDarkBlue.dart';
import 'package:flutter_clean_architecture/core/colors/ColorsGreen.dart';
import 'package:flutter_clean_architecture/core/colors/ColorsInf.dart';
import 'package:flutter_clean_architecture/core/models/base_bloc/base_state.dart';
import 'package:flutter_clean_architecture/core/util/AppConstants.dart';
import 'package:flutter_clean_architecture/core/util/ScreenUtil.dart';
import 'package:flutter_clean_architecture/core/util/injection_container.dart';
import 'package:flutter_clean_architecture/core/util/internationalization/local/AppLocalizations.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_clean_architecture/features/login/presentation/screens/LoginPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart' as Toast;
import 'package:logger/logger.dart';

import 'BaseContract.dart';

abstract class BaseScreen extends StatefulWidget {
  BaseScreen({Key key}) : super(key: key);
}

abstract class BaseScreenState<T extends BaseScreen> extends State<T>
    implements BaseView {
  bool _isLoading = false;

  ColorsInf appColors = ColorsBlue();
  String currentAppTheme = BLUE;
  ScreenUtil screenUtil;
  Logger logger;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    logger = sl();
    currentAppTheme = getAppThemeFromPref();
  }

  @override
  Widget build(BuildContext context) {
    screenUtil = getScreenUtilInstance(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appColors.secondaryColor,
    ));

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.white,
        child: body(context),
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Widget body(BuildContext context) =>
      MultiBlocListener(
        listeners: [
          BlocListener<AuthenticationBloc, BaseApiState>(
            listener: (context, state) {
              if (state is ApiErrorState) {
                stateError(state);
              }
              print("Bloc Test::  " +
                  " Listener AuthenticationBloc" +
                  state.toString());
            },
          ),
        ],
        child: getCustomBloc(),
      );

  @override
  void autoLoginUser() {}

  @override
  void showErrorDialog(String errorMessage) =>
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Text'),
          backgroundColor: Colors.red,
        ),
      );

  @override
  void setAppTheme(String appTheme) {
    setState(() {
      currentAppTheme = appTheme;
      if (currentAppTheme == GREEN) {
        appColors = ColorsGreen();
      } else if (currentAppTheme == BLUE) {
        appColors = ColorsBlue();
      } else if (currentAppTheme == BLUE_DARK) {
        appColors = ColorsDarkBlue();
      }
    });
  }

  @override
  void unauthenticated() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        ModalRoute.withName("/SignIn"));
  }

  @override
  void showToast(String message) {
    Toast.Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.Toast.LENGTH_SHORT,
        gravity: Toast.ToastGravity.BOTTOM,
        timeInSecForIos: 2);
  }

  @override
  void openDashboardScreen() => null;

  @override
  void serverError() {
    Toast.Fluttertoast.showToast(
        msg: AppLocalizations.of(context).serverErrorText,
        toastLength: Toast.Toast.LENGTH_LONG,
        gravity: Toast.ToastGravity.BOTTOM,
        timeInSecForIos: 3);
  }

  @override
  void checkInternetConnectionError() => Toast.Fluttertoast.showToast(
      msg: AppLocalizations.of(context).checkInternetConnectionText,
      toastLength: Toast.Toast.LENGTH_LONG,
      gravity: Toast.ToastGravity.BOTTOM,
      timeInSecForIos: 3);

  @override
  String getAppThemeFromPref() {
    return null;
  }

  void stateError(ApiErrorState apiError) {
//    if (apiError is ErrorState) {
    showErrorDialog(apiError.message);
//    } else if (apiError is ServerErrorState) {
//      serverError();
//      showErrorDialog('Server Error!!');
//    } else if (apiError is AutoLoginState) {
//      autoLoginUser();
//      showErrorDialog('AutoLogin');
//    }
  }

  @override
  void redirectToVerificationAgain() {}

  @override
  void showMessageArrivedMessage() {}

  getCustomBloc();
}
