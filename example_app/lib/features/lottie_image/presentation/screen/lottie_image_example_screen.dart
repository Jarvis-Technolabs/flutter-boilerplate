import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:example_app/core/const/string_constants.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/image_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/const/image_constants.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/localizations/localization_extension.dart';

class LottieImageExampleScreen extends BaseScreen {
  const LottieImageExampleScreen();

  @override
  State<LottieImageExampleScreen> createState() =>
      _LottieImageExampleScreenState();
}

class _LottieImageExampleScreenState
    extends BaseScreenState<LottieImageExampleScreen> {
  @override
  Widget body(BuildContext context) => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_LOTTIE_IMAGE)
              .getWhiteColor17W500Inter(
                  screenUtil: screenUtil, appColors: appColors),
        ),
        body: Center(
          /// IC_LOTTIE_EMAIL_ANIMATION is lottie json path
          child: IC_LOTTIE_EMAIL_ANIMATION.getLottieImage(
              screenUtil: screenUtil, height: 400, width: 400),
        ),
      );
}
