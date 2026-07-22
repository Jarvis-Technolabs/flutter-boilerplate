import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:flutter/cupertino.dart';

class CustomCupertinoSwitchWidget extends BaseScreen {
  final double transformScale;
  final Function(bool) onSwitchValueChange;

  final Color activeColor;

  final Color trackColor;

  final bool switchValue;

  CustomCupertinoSwitchWidget(
      {required this.transformScale,
      required this.onSwitchValueChange,
      required this.activeColor,
      required this.trackColor,
      required bool this.switchValue});

  @override
  State<CustomCupertinoSwitchWidget> createState() =>
      _CustomCupertinoSwitchWidgetState();
}

class _CustomCupertinoSwitchWidgetState
    extends BaseScreenState<CustomCupertinoSwitchWidget> {
  @override
  Widget body(_) => Transform.scale(
        scale: widget.transformScale,
        child: CupertinoSwitch(
          trackColor: widget.trackColor,
          activeColor: widget.activeColor,
          value: widget.switchValue,
          onChanged: (bool value) {
            widget.onSwitchValueChange(value);
          },
        ),
      );
}
