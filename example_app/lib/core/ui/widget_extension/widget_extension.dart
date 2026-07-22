import 'package:example_app/core/const/api_constants.dart';
import 'package:example_app/core/const/string_constants.dart';
import 'package:example_app/core/localizations/app_localizations.dart';
import 'package:example_app/core/localizations/localization_extension.dart';
import 'package:example_app/core/ui/theme/colors/colors_inf.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../util/screen_util/screen_util.dart';

extension WidgetExtension on Widget {
  ///Apply all padding
  Widget paddingAll({
    required double padding,
    required ScreenUtil screenUtil,
  }) =>
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          screenUtil.setWidth(padding),
          screenUtil.setHeight(padding),
          screenUtil.setWidth(padding),
          screenUtil.setHeight(padding),
        ),
        child: this,
      );

  ///Apply symmetric padding
  Widget paddingSymmetric({
    double horizontalPadding = 0.0,
    double verticalPadding = 0.0,
    required ScreenUtil screenUtil,
  }) =>
      Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: screenUtil.setWidth(horizontalPadding),
          vertical: screenUtil.setHeight(verticalPadding),
        ),
        child: this,
      );

  ///Apply padding for specific side
  Widget paddingOnly(
    ScreenUtil screenUtil, {
    double paddingTop = 0,
    double paddingBottom = 0,
    double paddingLeft = 0,
    double paddingRight = 0,
  }) =>
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          screenUtil.setWidth(paddingLeft),
          screenUtil.setHeight(paddingTop),
          screenUtil.setWidth(paddingRight),
          screenUtil.setHeight(paddingBottom),
        ),
        child: this,
      );

  Widget doneKeyBoard({
    required ColorsInf appColors,
    required FocusNode? node,
    required BuildContext context,
    required ScreenUtil screenUtil,
    Function? onPressed,
    showDoneButton = true,
  }) =>
      showDoneButton
          ? KeyboardActions(
              autoScroll: false,
              config: KeyboardActionsConfig(
                keyboardActionsPlatform: KEYBOARD_TYPE,
                nextFocus: false,
                actions: [
                  KeyboardActionsItem(
                    focusNode: node!,
                    toolbarButtons: [
                      (node) {
                        return InkWell(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (onPressed != null) {
                              onPressed();
                            }
                          },
                          child: getDoneWidget(
                            screenUtil: screenUtil,
                            context: context,
                            appColors: appColors,
                          ),
                        );
                      }
                    ],
                  ),
                ],
              ),
              child: this,
            )
          : this;

  Widget getDoneWidget({
    required ScreenUtil screenUtil,
    required BuildContext context,
    required ColorsInf appColors,
  }) =>
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          screenUtil.setWidth(5),
          screenUtil.setHeight(10),
          screenUtil.setWidth(15),
          screenUtil.setHeight(10),
        ),
        child: context.tr(LABEL_DONE_KEYBOARD)
            .getDoneText(
              screenUtil: screenUtil,
              appColors: appColors,
            ),
      );
}
