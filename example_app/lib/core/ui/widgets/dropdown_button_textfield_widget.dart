import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter/material.dart';

import '../theme/text_style_extension/text_style_extension.dart';

class DropdownButtonTextFieldWidget extends BaseScreen {
  final Function(String) onItemSelectionChange;
  final InputDecoration? inputDecoration;

  final List<String> dropDownList;

  final String? selectedValue;

  final String labelText;

  final String? errorText;

  final bool? isMandatoryField;

  const DropdownButtonTextFieldWidget({
    required this.labelText,
    this.errorText,
    this.isMandatoryField = false,
    required this.onItemSelectionChange,
    this.inputDecoration,
    required this.dropDownList,
    this.selectedValue,
  });

  @override
  State<DropdownButtonTextFieldWidget> createState() =>
      _DropdownButtonTextFieldWidgetState();
}

class _DropdownButtonTextFieldWidgetState
    extends BaseScreenState<DropdownButtonTextFieldWidget> {
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
            data: Theme.of(context).copyWith(
              buttonTheme: ButtonTheme.of(context).copyWith(
                alignedDropdown: true,
              ),
            ),
            child: DropdownButtonFormField(
              decoration: widget.inputDecoration,
              dropdownColor: appColors.screenBgColor,
              value: widget.selectedValue,
              onChanged: (String? newValue) {
                widget.onItemSelectionChange(newValue!);
              },
              items: widget.dropDownList
                  .map<DropdownMenuItem<String>>((String _value) =>
                      DropdownMenuItem<String>(
                          value: _value,
                          child: _value.getFormTextInter(
                              screenUtil: screenUtil, appColors: appColors)))
                  .toList(),
            ),
          ),
          (widget.errorText != "" && widget.errorText != null)
              ? widget.errorText!.getFormErrorTextInter(
                  screenUtil: screenUtil, appColors: appColors, maxLine: 4)
              : SizedBox.shrink(),
        ],
      );
}
