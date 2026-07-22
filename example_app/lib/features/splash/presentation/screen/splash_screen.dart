import 'dart:async';
import 'dart:io';

import 'package:example_app/core/ui/widget_extension/image_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:store_redirect/store_redirect.dart';

import '../../../../core/base/screen/base_bloc_widget.dart';
import '../../../../core/const/app_constants.dart';
import '../../../../core/const/image_constants.dart';
import '../../../../core/const/string_constants.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/ui/widgets/custom_alert.dart';
import '../../../../core/ui/widgets/show_app_dialog.dart';
import '../../../jail_break/jail_break_repository/jail_break_repo.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';
import '../bloc/splash_state.dart';

class SplashScreen extends BaseBlocWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseBlocWidgetState<SplashScreen> {
  JailBreakRepo jailBreakRepo = sl();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.initState();
    checkJailBreak();
  }

  Future<void> checkJailBreak() async {
    bool? isJailBreak = await jailBreakRepo.getJailBreakStatus();
    if (isJailBreak!) {
      navigateTo(context, Routes.jailBreakScreen);
    } else {
      apiCall();
    }
  }

  void apiCall() async {
    if (preferenceHelper.getIsUserLoggedIn()) {
      BlocProvider.of<SplashBloc>(context).add(
        FetchGetMobileConfigEventDataEvent(),
      );
    } else {
      String? publicToken = await preferenceHelper.getPublicToken();
      if (publicToken == null || publicToken.isEmpty) {
        BlocProvider.of<SplashBloc>(context).add(
          PublicTokenEvent(),
        );
      } else {
        BlocProvider.of<SplashBloc>(context).add(
          FetchGetMobileConfigEventDataEvent(),
        );
      }
    }
  }

  @override
  Widget getCustomBloc() => BlocConsumer<SplashBloc, SplashState>(
    listener: (_, state) {
      if (state is GetMobileConfigFetchedState) {
        if (state.isAllowed) {
          navigateAndRemoveAll(
            context: context,
            routeName: Routes.examplePage,
          );
        } else {
          commonUtilities.showAppUpdateDialog(context: context,screenUtil: screenUtil,appColors: appColors);
        }
      } else if (state is GeneratePublicTokenErrorState) {
        commonUtilities.showToast(
          message: AppLocalizations.of(context).translateOrKey(
            state.message,
          ),
          textColors: appColors.whiteColor,
          backgroundColors: appColors.blackColor,
        );
      }
    },
    builder: (_, state) => Scaffold(
      backgroundColor: appColors.screenBgColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: IC_SPLASH_BACKGROUND.getImage(
              screenUtil: screenUtil,
              boxFit: BoxFit.fill,
            ),
          ),
          Center(
            child: IC_APP_LOGO.getImage(
              screenUtil: screenUtil,
            ),
          ),
        ],
      ),
    ),
  );

//TODO: GIF EXAMPLE
/*
 @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        body: Center(
          child: Image.asset(
            LOGO_GIF,
            fit: BoxFit.contain,
            height: 108.0,
            width: 280.0,
          ),
        ),
      );
*/

//TODO: Lottie EXAMPLE
/*
  @override
  Widget getCustomBloc() => Scaffold(
    backgroundColor: appColors.screenBgColor,
    body: Center(
      child: LottiePlayerAssets(
        asset: SPLASH_ANIMATION_PATH,
        onComplete: () {
          Future.delayed(Duration(seconds: 5), () {
            navigatePushReplacementWithName(context, Routes.examplePage);
          });
        },
      ),
    ),
  );
 */

}
