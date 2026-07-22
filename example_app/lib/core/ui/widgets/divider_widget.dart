import 'package:flutter/material.dart';
import 'package:example_app/core/base/screen/base_screen.dart';

class DividerWidget extends BaseScreen {
  final Color? color;

  DividerWidget({
    this.color,
  });

  @override
  _DividerWidgetState createState() => _DividerWidgetState();
}

class _DividerWidgetState extends BaseScreenState<DividerWidget> {
  @override
  Widget body(_) => Divider(
        color: widget.color ?? appColors.dividerColor,
        thickness: 1,
        height: 1,
      );
}
