import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/features/social_login/presentation/bloc/social_login_bloc.dart';
import 'package:example_app/features/social_login/presentation/bloc/social_login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/const/string_constants.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/localizations/localization_extension.dart';
import '../../../../core/ui/widgets/button.dart';

import '../bloc/social_login_event.dart';

class SocialLoginScreen extends BaseBlocWidget {
  @override
  State<SocialLoginScreen> createState() => _SocialLoginScreenState();
}

class _SocialLoginScreenState extends BaseBlocWidgetState<SocialLoginScreen> {
  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_SOCIAL_LOGIN)
              .getWhiteColor17W500Inter(
                  screenUtil: screenUtil, appColors: appColors),
        ),
        body: BlocConsumer<SocialLoginBloc, SocialLoginState>(
          listener: (context, state) {
            /// manage states

            if (state is GoogleSignInSuccessState) {
              commonUtilities.showToast(
                message: context.tr(LABEL_USER_SIGN_IN_SUCCESSFULLY),
                backgroundColors: appColors.blackColor,
                textColors: appColors.whiteColor,
              );
            }
            if (state is AppleSignInSuccessState) {
              commonUtilities.showToast(
                message: context.tr(LABEL_USER_SIGN_IN_SUCCESSFULLY),
                backgroundColors: appColors.blackColor,
                textColors: appColors.whiteColor,
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  title: context.tr(LABEL_SIGN_IN_WITH_GOOGLE),
                  backgroundColor: appColors.primaryColor,
                  buttonTextColor: appColors.whiteColor,
                  selectHandler: () => _googleSignInHandler(),
                ).paddingOnly(
                  screenUtil,
                  paddingBottom: 30,
                ),
                PrimaryButton(
                  title: context.tr(LABEL_SIGN_IN_WITH_APPLE),
                  backgroundColor: appColors.primaryColor,
                  buttonTextColor: appColors.whiteColor,
                  selectHandler: () => appleSignInHandler(),
                ).paddingOnly(
                  screenUtil,
                  paddingBottom: 30,
                ),
              ],
            );
          },
        ).paddingAll(
          padding: 20,
          screenUtil: screenUtil,
        ),
      );

  /// call google sign in event
  void _googleSignInHandler() {
    BlocProvider.of<SocialLoginBloc>(context).add(CallGoogleSignInEvent());
  }

  /// call apple sign in event
  Future<void> appleSignInHandler() async {
    BlocProvider.of<SocialLoginBloc>(context).add(CallAppleSignInEvent());
  }
}
