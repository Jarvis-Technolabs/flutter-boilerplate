import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:example_app/core/const/string_constants.dart';
import 'package:example_app/core/localizations/localization_extension.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/core/ui/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../localizations/app_localizations.dart';
import '../../routes/routes.dart';

class CustomAlert extends BaseScreen {
  final String titleText;
  final String? buttonText;
  final String? descriptionText;
  final Function? onClick;

  CustomAlert({
    required this.titleText,
    this.descriptionText,
    this.onClick,
    this.buttonText,
  });

  @override
  State<CustomAlert> createState() => _CustomAlertState();
}

class _CustomAlertState extends BaseScreenState<CustomAlert> {
  @override
  Widget body(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.titleText.getText20W600Text(
            appColors: appColors,
            screenUtil: screenUtil,
            maxLine: 3,
          ),
          if (widget.descriptionText != null &&
              widget.descriptionText!.isNotEmpty) ...[
            SizedBox(
              height: screenUtil.setHeight(16.0),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: widget.descriptionText!.getSubtext16W400Text(
                  appColors: appColors,
                  screenUtil: screenUtil,
                  maxLine: null,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          ],
          SizedBox(
            height: screenUtil.setHeight(24.0),
          ),
          PrimaryButton(
            title: widget.buttonText ??
                context.tr(LABEL_TITLE_OK),
            backgroundColor: appColors.primaryColor,
            buttonTextColor: appColors.whiteColor,
            selectHandler: () {
              goBack(context);
              if (widget.onClick != null) {
                widget.onClick!();
              }
            },
            borderColor: appColors.primaryColor,
          ),
        ],
      ).paddingOnly(
        screenUtil,
        paddingLeft: 16.0,
        paddingRight: 16.0,
        paddingTop: 24.0,
        paddingBottom: 24.0,
      );
}
