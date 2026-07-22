import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter/material.dart';

class RadioButtonWithLabelWidget extends BaseScreen {
  final dynamic groupValue;

  final String title;
  final Function(dynamic) selectedValue;

  RadioButtonWithLabelWidget({
    required this.groupValue,
    required this.title,
    required this.selectedValue,
  });

  @override
  State<RadioButtonWithLabelWidget> createState() =>
      _RadioButtonWithLabelWidgetState();
}

class _RadioButtonWithLabelWidgetState
    extends BaseScreenState<RadioButtonWithLabelWidget> {
  @override
  Widget body(_) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: screenUtil.setHeight(15),
          width: screenUtil.setWidth(26),
          child: Radio(
              value: widget.title,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              groupValue: widget.groupValue,
              onChanged: (dynamic value) {
                widget.selectedValue(value);
              }).paddingOnly(screenUtil, paddingRight: 10),
        ),
        widget.title.getTextColor15W500Inter(
            screenUtil: screenUtil, appColors: appColors)
      ],
    );
  }
}
