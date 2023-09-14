import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_screen.dart';
import 'package:flutter_clean_architecture/core/const/image_constants.dart';
import 'package:flutter_clean_architecture/core/const/string_constants.dart';
import 'package:flutter_clean_architecture/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/image_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/widget_extension.dart';

import '../../../core/localizations/app_localizations.dart';

class JailBreakScreen extends BaseScreen {
  @override
  _JailBreakScreenState createState() => _JailBreakScreenState();
}

class _JailBreakScreenState extends BaseScreenState<JailBreakScreen> {
  @override
  Widget body(BuildContext context) => Material(
        child: Stack(
          children: [
            Positioned.fill(
              child: IC_SPLASH_BACKGROUND.getImage(
                screenUtil: screenUtil,
                boxFit: BoxFit.fill,
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IC_APP_LOGO.getImage(
                    screenUtil: screenUtil,
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(40),
                  ),
                  AppLocalizations.of(context)
                      .translate(LABEL_DEVICE_IS_ROOTED)
                      .getText20W600Text(
                        screenUtil: screenUtil,
                        appColors: appColors,
                        textAlign: TextAlign.center,
                      ),
                  SizedBox(
                    height: screenUtil.setHeight(8),
                  ),
                  SizedBox(
                    width: screenUtil.screenWidth,
                    child: AppLocalizations.of(context)
                        .translate(LABEL_JAIL_BREAK_DEC)
                        .getSubtext16W400Text(
                          screenUtil: screenUtil,
                          appColors: appColors,
                          maxLine: 3,
                          textAlign: TextAlign.center,
                        )
                        .paddingOnly(
                          screenUtil,
                          paddingLeft: 16.0,
                          paddingRight: 16.0,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
