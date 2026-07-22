import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends BaseScreen {
  final Color fillColor;

  final Color checkColor;
  final double height;
  final double width;

  final Function(bool) selectedValue;

  final bool isCheck;

  CheckboxWidget({
    required this.fillColor,
    required this.checkColor,
    required this.height,
    required this.width,
    required this.selectedValue,
    required this.isCheck,
  });

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends BaseScreenState<CheckboxWidget> {
  @override
  Widget body(_) => SizedBox(
        height: screenUtil.setHeight(widget.height),
        width: screenUtil.setWidth(widget.width),
        child: Checkbox(
          fillColor: MaterialStateProperty.all(widget.fillColor),
          checkColor: widget.checkColor,
          value: widget.isCheck,
          onChanged: (value) {
            widget.selectedValue(value!);
          },
        ),
      );
}
