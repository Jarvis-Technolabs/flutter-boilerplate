import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:flutter/material.dart';

import '../../util/date_util/date_utils.dart';
import 'custom_textfield_widget.dart';

class CustomDatePickerTextFieldWidget extends BaseScreen {
  final TextEditingController controller;

  final String labelText;

  final String hintText;

  final Widget? suffixIconWidget;

  final Widget? prefixIconWidget;

  final String? errorText;

  final bool? isMandatoryField;

  final Function(String value) onChanged;

  const CustomDatePickerTextFieldWidget({
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    this.suffixIconWidget,
    this.prefixIconWidget,
    this.isMandatoryField = false,
    this.errorText,
  });

  @override
  State<CustomDatePickerTextFieldWidget> createState() =>
      _CustomDatePickerTextFieldWidgetState();
}

class _CustomDatePickerTextFieldWidgetState
    extends BaseScreenState<CustomDatePickerTextFieldWidget> {
  @override
  Widget body(_) {
    return CustomTextFieldWidget(
      onTap: () async {
        DateTime? pickedDate = await DateUtil.selectDateFromPicker(
            context: context, appColors: appColors);
        if (pickedDate != null) {
          widget.controller.text =
              DateUtil.getSendAPIDateFormat(date: pickedDate);
        }
        widget.onChanged(widget.controller.text);
      },
      readOnly: true,
      controller: widget.controller,
      labelText: widget.labelText,
      hintText: widget.hintText,
      errorText: widget.errorText,
      suffixIconWidget: widget.suffixIconWidget,
      prefixIconWidget: widget.prefixIconWidget,
      isMandatoryField: widget.isMandatoryField,
      textInputAction: TextInputAction.next,
    );
  }
}
