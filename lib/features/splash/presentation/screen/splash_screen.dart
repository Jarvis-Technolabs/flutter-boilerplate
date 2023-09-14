import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/image_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/widget_extension.dart';
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
import '../../../../core/util/utilities.dart';
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
  StreamController<bool> showButtonsStreamController =
      StreamController<bool>.broadcast();

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
              if (preferenceHelper.getIsUserLoggedIn()) {
                ///Navigate to other screen
                comingSoon();
              } else {
                showButtonsStreamController.add(true);
              }
            } else {
              showAppUpdateDialog();
            }
          } else if (state is GeneratePublicTokenErrorState) {
            Utilities.showToast(
              message: state.message,
              appColors: appColors,
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
              Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: StreamBuilder<bool>(
                    initialData: false,
                    stream: showButtonsStreamController.stream,
                    builder: (_, snapshot) => snapshot.data!
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppLocalizations.of(context)
                                  .translate(LABEL_LOGIN_FOR_EXISTING_USERS)
                                  .getSubText16W500Text(
                                      screenUtil: screenUtil,
                                      appColors: appColors),
                              GestureDetector(
                                onTap: () {
                                  comingSoon();
                                },
                                child: ColoredBox(
                                  color: appColors.transparentColor,
                                  child: (" " +
                                          AppLocalizations.of(context)
                                              .translate(LABEL_LOG_IN))
                                      .getPrimarySubtext16W500Text(
                                        screenUtil: screenUtil,
                                        appColors: appColors,
                                      )
                                      .paddingOnly(
                                        screenUtil,
                                        paddingLeft: 2,
                                        paddingRight: 16,
                                        paddingBottom: 16,
                                        paddingTop: 16,
                                      ),
                                ),
                              )
                            ],
                          ).paddingOnly(
                            screenUtil,
                            paddingLeft: 16,
                            paddingRight: 16,
                          )
                        : SizedBox.shrink(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Future<dynamic> showAppUpdateDialog() => showAppDialog(
        context: context,
        screenUtil: screenUtil,
        appColors: appColors,
        barrierDismissible: false,
        child: CustomAlert(
          titleText: AppLocalizations.of(context).translate(LABEL_UPDATE),
          descriptionText: getAppUpdateErrorMessage(),
          buttonText: AppLocalizations.of(context).translate(LABEL_UPDATE),
          onClick: () {
            PackageInfo.fromPlatform().then(
              (PackageInfo packageInfo) {
                StoreRedirect.redirect(
                  androidAppId: PLAY_STORE_ID,
                  iOSAppId: APP_STORE_ID,
                );
              },
            );
            closeApp();
          },
        ),
      );

  String getAppUpdateErrorMessage() {
    if (Platform.isAndroid) {
      return AppLocalizations.of(context).translate(LABEL_PLAY_STORE_UPDATE);
    } else if (Platform.isIOS) {
      return AppLocalizations.of(context).translate(LABEL_APP_STORE_UPDATE);
    } else {
      return "";
    }
  }
}
