import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_screen.dart';
import 'package:flutter_clean_architecture/core/const/string_constants.dart';
import 'package:flutter_clean_architecture/core/localizations/app_localizations.dart';
import 'package:flutter_clean_architecture/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/outline_common_button.dart';

import '../../routes/routes.dart';

class CustomAlertWithTwoButtons extends BaseScreen {
  final String titleText;
  final String buttonTitleText;
  final String descriptionText;
  final Function? onClick;

  CustomAlertWithTwoButtons(
    this.titleText,
    this.descriptionText, {
    this.onClick,
    this.buttonTitleText = LABEL_TITLE_OK,
  });

  @override
  State<CustomAlertWithTwoButtons> createState() =>
      _CustomAlertWithTwoButtonsState();
}

class _CustomAlertWithTwoButtonsState
    extends BaseScreenState<CustomAlertWithTwoButtons> {
  @override
  Widget body(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenUtil.setHeight(25.0),
          horizontal: screenUtil.setHeight(20.0),
        ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            widget.titleText.getText20W600Text(
              screenUtil: screenUtil,
              appColors: appColors,
            ),
            SizedBox(height: screenUtil.setHeight(18.0)),
            widget.descriptionText.getDescriptionText16W400Text(
              screenUtil: screenUtil,
              appColors: appColors,
              maxLine: 10,
            ),
            SizedBox(height: screenUtil.setHeight(23.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineCommonButton(
                  title: AppLocalizations.of(context).translate(LABEL_CLOSE),
                  backgroundColor: appColors.whiteColor,
                  buttonTextColor: appColors.textColor,
                  selectHandler: () => goBack(context),
                  borderColor: appColors.inactiveSteeperColor,
                ),
                OutlineCommonButton(
                  title: AppLocalizations.of(context).translate(widget.buttonTitleText),
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
            ),
          ],
        ),
      );
}
