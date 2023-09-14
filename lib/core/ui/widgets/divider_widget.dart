import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_screen.dart';

class DividerWidget extends BaseScreen {
  final Color? color;

  DividerWidget({this.color});

  @override
  _DividerWidgetState createState() => _DividerWidgetState();
}

class _DividerWidgetState extends BaseScreenState<DividerWidget> {
  @override
  Widget body(BuildContext _) => Divider(
        color: widget.color ?? appColors.dividerColor,
        thickness: 1,
        height: 1,
      );
}
