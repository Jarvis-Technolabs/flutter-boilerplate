import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_screen.dart';
import 'package:flutter_clean_architecture/core/const/string_constants.dart';
import 'package:flutter_clean_architecture/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/widget_extension.dart';

import '../../localizations/app_localizations.dart';
import '../../routes/routes.dart';

class TextButton extends BaseScreen {
  final GestureTapCallback onTap;
  final String text;

  TextButton({
    required this.text,
    required this.onTap,
  });

  @override
  _TextButtonState createState() => _TextButtonState();
}

class _TextButtonState extends BaseScreenState<TextButton> {
  @override
  Widget body(_) => GestureDetector(
        onTap: widget.onTap,
        child: ColoredBox(
          color: appColors.transparentColor,
          child: widget.text
              .getPrimary14W600Text(
                screenUtil: screenUtil,
                appColors: appColors,
              )
              .paddingOnly(
                screenUtil,
                paddingTop: 16.0,
                paddingLeft: 14.0,
                paddingRight: 14.0,
                paddingBottom: 14.0,
              ),
        ),
      );
}

class SaveTextButton extends BaseScreen {
  final GestureTapCallback onTap;

  SaveTextButton({
    required this.onTap,
  });

  @override
  _SaveTextButtonState createState() => _SaveTextButtonState();
}

class _SaveTextButtonState extends BaseScreenState<SaveTextButton> {
  @override
  Widget body(_) => TextButton(
        text: AppLocalizations.of(context).translate(LABEL_TITLE_SAVE_CAPITAL),
        onTap: widget.onTap,
      );
}

class OkTextButton extends BaseScreen {
  final GestureTapCallback onTap;

  OkTextButton({
    required this.onTap,
  });

  @override
  _OkTextButtonState createState() => _OkTextButtonState();
}

class _OkTextButtonState extends BaseScreenState<OkTextButton> {
  @override
  Widget body(_) => TextButton(
        text: AppLocalizations.of(context).translate(LABEL_TITLE_OK),
        onTap: widget.onTap,
      );
}

class CancelTextButton extends BaseScreen {
  @override
  _CancelTextButtonState createState() => _CancelTextButtonState();
}

class _CancelTextButtonState extends BaseScreenState<CancelTextButton> {
  @override
  Widget body(_) => TextButton(
        text: AppLocalizations.of(context).translate(LABEL_TITLE_CANCEL),
        onTap: () {
          goBack(context);
        },
      );
}

class CloseTextButton extends BaseScreen {
  @override
  _CloseTextButtonState createState() => _CloseTextButtonState();
}

class _CloseTextButtonState extends BaseScreenState<CloseTextButton> {
  @override
  Widget body(_) => TextButton(
        text: AppLocalizations.of(context).translate(LABEL_CLOSE),
        onTap: () {
          goBack(context);
        },
      );
}

class OkAndCancelTextButton extends BaseScreen {
  final GestureTapCallback onTap;
  final double paddingRight;

  OkAndCancelTextButton({
    required this.onTap,
    this.paddingRight = 18,
  });

  @override
  _OkAndCancelTextButtonState createState() => _OkAndCancelTextButtonState();
}

class _OkAndCancelTextButtonState
    extends BaseScreenState<OkAndCancelTextButton> {
  @override
  Widget body(_) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CancelTextButton(),
          OkTextButton(
            onTap: widget.onTap,
          ).paddingOnly(
            screenUtil,
            paddingRight: widget.paddingRight,
          ),
        ],
      );
}

class ConfirmationTextButton extends BaseScreen {
  final GestureTapCallback onRight;
  final GestureTapCallback onLeft;
  final String onRightText;
  final String onLeftText;
  final bool isSpacer;

  ConfirmationTextButton({
    required this.onRight,
    required this.onLeft,
    required this.onRightText,
    required this.onLeftText,
    this.isSpacer = false,
  });

  @override
  _ConfirmationTextButtonState createState() => _ConfirmationTextButtonState();
}

class _ConfirmationTextButtonState
    extends BaseScreenState<ConfirmationTextButton> {
  @override
  Widget body(_) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            text: widget.onLeftText,
            onTap: widget.onLeft,
          ),
          widget.isSpacer ? Spacer() : SizedBox.shrink(),
          TextButton(
            text: widget.onRightText,
            onTap: widget.onRight,
          ),
        ],
      );
}

class DoneTextButton extends BaseScreen {
  final GestureTapCallback onTap;

  DoneTextButton({
    required this.onTap,
  });

  @override
  _DoneTextButtonState createState() => _DoneTextButtonState();
}

class _DoneTextButtonState extends BaseScreenState<DoneTextButton> {
  @override
  Widget body(_) => TextButton(
        text: AppLocalizations.of(context).translate(LABEL_DONE),
        onTap: widget.onTap,
      );
}
