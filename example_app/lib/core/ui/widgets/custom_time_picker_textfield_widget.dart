import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:flutter/material.dart';

import '../../util/date_util/date_utils.dart';
import 'custom_textfield_widget.dart';

class CustomTimePickerTextFieldWidget extends BaseScreen {
  final TextEditingController controller;

  final String labelText;

  final String hintText;
  final String? errorText;

  final Widget? suffixIconWidget;

  final Widget? prefixIconWidget;
  final bool? isMandatoryField;

  final Function(String) onChanged;

  const CustomTimePickerTextFieldWidget(
      {required this.controller,
      required this.labelText,
      required this.hintText,
      required this.onChanged,
      this.errorText,
      this.suffixIconWidget,
      this.prefixIconWidget,
      this.isMandatoryField = false});

  @override
  State<CustomTimePickerTextFieldWidget> createState() =>
      _CustomTimePickerTextFieldWidgetState();
}

class _CustomTimePickerTextFieldWidgetState
    extends BaseScreenState<CustomTimePickerTextFieldWidget> {
  @override
  Widget body(_) {
    return CustomTextFieldWidget(
      onTap: () async {
        TimeOfDay? pickedTime =
            await DateUtil.selectTime(context: context, appColors: appColors);
        if (pickedTime != null) {
          widget.controller.text = pickedTime.format(context);
          widget.onChanged(widget.controller.text);
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
