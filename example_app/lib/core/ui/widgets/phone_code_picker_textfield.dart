import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../theme/text_style_extension/text_style_extension.dart';

class PhoneCodePickerTextField extends BaseScreen {
  final TextEditingController controller;

  final String languageCode;

  final String labelText;

  final String? errorText;

  final bool? isMandatoryField;

  final String initialCountryCode;

  final Function(PhoneNumber) onPhoneNumberChange;
  final InputDecoration? inputDecoration;

  const PhoneCodePickerTextField({
    required this.controller,
    required this.languageCode,
    required this.onPhoneNumberChange,
    required this.initialCountryCode,
    this.inputDecoration,
    this.isMandatoryField = false,
    required this.labelText,
    this.errorText,
  });

  @override
  State<PhoneCodePickerTextField> createState() =>
      _PhoneCodePickerTextFieldState();
}

class _PhoneCodePickerTextFieldState
    extends BaseScreenState<PhoneCodePickerTextField> {
  FocusNode focusNode = FocusNode();
  @override
  Widget body(_) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.labelText.getFormLabelTextInter(
                  screenUtil: screenUtil, appColors: appColors),
              widget.isMandatoryField == true
                  ? "*"
                      .getFormLabelTextInter(
                          screenUtil: screenUtil, appColors: appColors)
                      .paddingOnly(screenUtil, paddingLeft: 5)
                  : SizedBox.shrink()
            ],
          ).paddingOnly(screenUtil, paddingBottom: 7),
          Theme(
            data: ThemeData().copyWith(
              colorScheme: ThemeData()
                  .colorScheme
                  .copyWith(primary: appColors.primaryColor),
            ),
            child: IntlPhoneField(
              focusNode: focusNode,
              initialCountryCode: widget.initialCountryCode,
              style: getFormTextStyle(
                  screenUtil: screenUtil, appColors: appColors),
              flagsButtonPadding:
                  EdgeInsets.only(bottom: screenUtil.setHeight(3)),
              textAlignVertical: TextAlignVertical.center,
              dropdownIcon: Icon(
                Icons.arrow_drop_down_outlined,
                color: appColors.primaryColor,
              ),
              dropdownTextStyle: getFormTextStyle(
                  screenUtil: screenUtil, appColors: appColors),
              controller: widget.controller,
              decoration: widget.inputDecoration ?? InputDecoration(),
              languageCode: widget.languageCode,
              textInputAction: TextInputAction.next,
              onChanged: (phone) {
                widget.onPhoneNumberChange(phone);
              },
              onCountryChanged: (country) {},
            ),
          ).paddingOnly(
            screenUtil,
            paddingBottom: 7,
          ),
        ],
      ).doneKeyBoard(
        screenUtil: screenUtil,
        appColors: appColors,
        context: context,
        node: focusNode,
      );
}
