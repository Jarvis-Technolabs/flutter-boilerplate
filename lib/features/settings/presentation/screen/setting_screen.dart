import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_bloc_widget.dart';
import 'package:flutter_clean_architecture/core/const/string_constants.dart';
import 'package:flutter_clean_architecture/core/localizations/app_localizations.dart';
import 'package:flutter_clean_architecture/core/routes/routes.dart';
import 'package:flutter_clean_architecture/core/ui/theme/text_extension/text_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/common_app_bar.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/custom_alert_with_two_buttons.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/divider_widget.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/show_app_dialog.dart';
import 'package:flutter_clean_architecture/features/logout/data/model/logout_request_model.dart';
import 'package:flutter_clean_architecture/features/logout/presentation/bloc/logout_bloc.dart';
import 'package:flutter_clean_architecture/features/logout/presentation/bloc/logout_event.dart';
import 'package:flutter_clean_architecture/features/logout/presentation/bloc/logout_state.dart';
import 'package:flutter_clean_architecture/features/settings/presentation/bloc/setting_bloc.dart';
import 'package:flutter_clean_architecture/features/settings/presentation/bloc/setting_state.dart';
import 'package:flutter_clean_architecture/features/splash/presentation/splash_page.dart';
import 'package:chucker_flutter/src/view/helper/chucker_ui_helper.dart';

import '../../../../core/localizations/localization_extension.dart';

class SettingScreen extends BaseBlocWidget {
  SettingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends BaseBlocWidgetState<SettingScreen> {
  @override
  Widget getCustomBloc() => MultiBlocListener(
        listeners: [
          BlocListener<LogoutBloc, LogoutState>(
            listener: (BuildContext context, LogoutState state) async {
              if (state is LogoutUserState) {
                await commonUtilities.trackUserEngagementEvent(
                  eventName: 'logout',
                  additionalParameters: {
                    'source_screen': LABEL_SETTINGS,
                  },
                );
                await commonUtilities.clearAnalyticsUserContext();
                await navigateAndRemoveAll(
                  context: context,
                  routeName: Routes.splash,
                  route: SplashPage(),
                );
              }
            },
          )
        ],
        child: BlocConsumer<SettingBloc, SettingState>(
          listener: (_, state) {},
          builder: (_, state) => Scaffold(
            backgroundColor: appColors.screenBgColor,
            appBar: CommonAppBar(
              title: LABEL_SETTINGS,
            ),
            body: settingWidget(),
          ),
        ),
      );

  Widget settingWidget() => SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                ChuckerUiHelper.showChuckerScreen();
              },
              child: Row(
                children: [
                  AppLocalizations.of(context)
                      .translate(LABEL_CHUCKER)
                      .getText14W500Text(
                    screenUtil: screenUtil,
                    appColors: appColors,
                  ),
                ],
              ).paddingAll(
                padding: 20,
                screenUtil: screenUtil,
              ),
            ),
            DividerWidget(),
            InkWell(
              onTap: () {
                navigateTo(
                  context,
                  Routes.deleteAccountPage,
                );
              },
              child: Row(
                children: [
                  context.tr(LABEL_DELETE_ACCOUNT)
                      .getText14W500Text(
                        screenUtil: screenUtil,
                        appColors: appColors,
                      ),
                ],
              ).paddingAll(
                padding: 20,
                screenUtil: screenUtil,
              ),
            ),
            DividerWidget(),
            InkWell(
              onTap: () {
                showAppDialog(
                  context: context,
                  appColors: appColors,
                  screenUtil: screenUtil,
                  child: CustomAlertWithTwoButtons(
                    context.tr(LABEL_LOGOUT),
                    context.tr(LABEL_LOGOUT_QUESTION),
                    onClick: () {
                      logoutAccountAPI();
                    },
                  ),
                );
              },
              child: Row(
                children: [
                  context.tr(LABEL_LOGOUT)
                      .getText14W500Text(
                        screenUtil: screenUtil,
                        appColors: appColors,
                      ),
                ],
              ).paddingAll(
                padding: 20,
                screenUtil: screenUtil,
              ),
            ),
          ],
        ),
      );

  void logoutAccountAPI() {
    BlocProvider.of<LogoutBloc>(context).add(
      LogoutUserEvent(
        request: LogoutRequestModel(
          userId: 0,
        ),
      ),
    );
  }
}
