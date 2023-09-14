import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_screen.dart';
import 'package:flutter_clean_architecture/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/image_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/widget_extension.dart';

class OutlineCommonButton extends BaseScreen {
  final String title;
  final Color backgroundColor;
  final Color? buttonTextColor;
  final VoidCallback? selectHandler;
  final Color borderColor;
  final Icon? icon;
  final String? iconUrl;
  final MainAxisSize mainAxisSize;
  final EdgeInsets? edgeInsets;
  final double fontSize;
  final Widget? iconWidget;
  final double borderRadius;
  final double innerPadding;

  OutlineCommonButton({
    required this.title,
    required this.backgroundColor,
    this.buttonTextColor,
    required this.selectHandler,
    required this.borderColor,
    this.icon,
    this.edgeInsets,
    this.mainAxisSize = MainAxisSize.max,
    this.iconUrl,
    this.fontSize = 14,
    this.iconWidget,
    this.borderRadius = 10.0,
    this.innerPadding = 8.0,
  });

  @override
  _OutlineCommonButtonState createState() => _OutlineCommonButtonState();
}

class _OutlineCommonButtonState extends BaseScreenState<OutlineCommonButton> {
  @override
  Widget body(BuildContext context) => OutlinedButton(
        onPressed: widget.selectHandler,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                widget.borderRadius,
              ),
              side: BorderSide(color: widget.borderColor),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: widget.borderColor),
          ),
          padding: MaterialStateProperty.all(
            widget.edgeInsets ??
                EdgeInsets.only(
                  top: screenUtil.setHeight(widget.innerPadding),
                  bottom: screenUtil.setHeight(widget.innerPadding),
                  left: screenUtil.setWidth(12.0),
                  right: screenUtil.setWidth(12.0),
                ),
          ),
        ),
        child: Row(
          mainAxisSize: widget.mainAxisSize,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null) ...[
              widget.icon!.paddingOnly(screenUtil, paddingRight: 5)
            ] else if (widget.iconUrl != null) ...[
              widget.iconUrl!
                  .getIconImage(
                      screenUtil: screenUtil,
                      boxFit: BoxFit.fill,
                      height: 18,
                      width: 18)
                  .paddingOnly(screenUtil, paddingRight: 5)
            ] else if (widget.iconWidget != null) ...[
              widget.iconWidget!,
            ],
            widget.title.getOutlineCommonButtonText14W400Text(
              appColors: appColors,
              screenUtil: screenUtil,
              color: widget.buttonTextColor,
            ),
          ],
        ),
      );
}
