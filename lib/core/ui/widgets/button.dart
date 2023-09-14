import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_screen.dart';
import 'package:flutter_clean_architecture/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/image_extension.dart';

/*class PrimaryButton extends BaseScreen {
  final String? title;
  final String? suffixIcon;
  final Color? backgroundColor;
  final Color? buttonTextColor;
  final Color? borderColor;
  final VoidCallback? selectHandler;
  final String? prefixIcon;
  final Widget? childWidget;
  final bool isEnabled;
  final Color? preFixImgColor;

  PrimaryButton({
    this.title,
    this.suffixIcon,
    this.backgroundColor,
    this.buttonTextColor,
    this.selectHandler,
    this.borderColor,
    this.prefixIcon,
    this.childWidget,
    this.isEnabled = true,
    this.preFixImgColor,
  });

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends BaseScreenState<PrimaryButton> {
  @override
  Widget body(BuildContext context) => AbsorbPointer(
        absorbing: !widget.isEnabled,
        child: OutlinedButton(
          onPressed: () {
            widget.selectHandler?.call();
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              appColors.secondaryColor,
            ),
            minimumSize: MaterialStateProperty.all(
              Size.fromHeight(
                screenUtil.setHeight(48.0),
              ),
            ),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(16.0),
                vertical: screenUtil.setHeight(10.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              widget.isEnabled
                  ? widget.backgroundColor ?? appColors.primaryColor
                  : appColors.disabledPrimaryButtonColor,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  4,
                ),
              ),
            ),
            side: MaterialStateProperty.all(
              BorderSide(
                color: widget.isEnabled
                    ? widget.borderColor ?? appColors.primaryColor
                    : appColors.transparentColor,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.prefixIcon != null) ...[
                widget.prefixIcon!.getIconImage(
                  screenUtil: screenUtil,
                  imgColor: widget.preFixImgColor,
                ),
                if (widget.title != null) ...[
                  SizedBox(
                    width: screenUtil.setWidth(12.0),
                  ),
                ],
              ],
              if (widget.title != null) ...[
                Flexible(
                  child: widget.title!.getPrimaryButtonText16W400Text(
                    screenUtil: screenUtil,
                    appColors: appColors,
                    textColor: widget.buttonTextColor,
                  ),
                ),
              ],
              if (widget.childWidget != null) ...[widget.childWidget!],
              if (widget.suffixIcon != null) ...[
                SizedBox(
                  width: screenUtil.setWidth(12.0),
                ),
                widget.suffixIcon!.getIconImage(
                  screenUtil: screenUtil,
                ),
              ],
            ],
          ),
        ),
      );
}*/

class PrimaryButton extends BaseScreen {
  final String? title;
  final String? suffixIcon;
  final Color? backgroundColor;
  final Color? buttonTextColor;
  final Color? borderColor;
  final VoidCallback? selectHandler;
  final Widget? prefixIcon;
  final Widget? childWidget;
  final Color? preFixImgColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? verticalPadding;
  // bool? isEnabled ;

  PrimaryButton(
      {this.title,
        this.suffixIcon,
        this.backgroundColor,
        this.buttonTextColor,
        this.selectHandler,
        this.borderColor,
        this.prefixIcon,
        this.childWidget,
        this.preFixImgColor,
        this.buttonWidth,
        this.buttonHeight,
        this.verticalPadding/*,this.isEnabled*/});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends BaseScreenState<PrimaryButton> {
  @override
  Widget body(BuildContext _) => SizedBox(
    width: widget.buttonWidth ?? double.infinity,
    child: ElevatedButton(
      onPressed: widget.selectHandler,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor ?? appColors.primaryColor,
        disabledBackgroundColor: appColors.disabledPrimaryButtonColor,
        minimumSize: Size(
          screenUtil.setWidth(widget.buttonWidth ?? double.infinity),
          screenUtil.setHeight(widget.buttonHeight ?? 50),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(16.0),
          vertical: screenUtil.setHeight(widget.verticalPadding ?? 10.0),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            7,
          ),
        ),
        side: BorderSide(
            color: widget.borderColor ?? appColors.transparentColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.prefixIcon != null) ...[
            widget.prefixIcon!,
            if (widget.title != null) ...[
              SizedBox(
                width: screenUtil.setWidth(4.0),
              ),
            ],
          ],
          if (widget.title != null) ...[
            Flexible(
              child: widget.title!.getPrimaryButtonText16W400Text(
                screenUtil: screenUtil,
                appColors: appColors,
                textColor: widget.buttonTextColor,
              ),
            ),
          ],
          if (widget.childWidget != null) ...[widget.childWidget!],
          if (widget.suffixIcon != null) ...[
            SizedBox(
              width: screenUtil.setWidth(12.0),
            ),
            widget.suffixIcon!.getIconImage(
              screenUtil: screenUtil,
            ),
          ],
        ],
      ),
    ),
  );
}
/*class OutLineButton extends BaseScreen {
  final String? title;
  final String? prefixIcon;
  final String? suffixIcon;
  final VoidCallback? selectHandler;
  final Color? borderColor;
  final bool isFullWidth;
  final bool isEnable;

  OutLineButton({
    this.selectHandler,
    this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.isEnable = true,
    this.isFullWidth = true,
  });

  @override
  _OutLineButtonState createState() => _OutLineButtonState();
}

class _OutLineButtonState extends BaseScreenState<OutLineButton> {
  @override
  Widget body(_) => OutlinedButton(
        onPressed: widget.isEnable
            ? () {
                widget.selectHandler?.call();
              }
            : null,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
            appColors.secondaryColor,
          ),
          minimumSize: widget.isFullWidth
              ? MaterialStateProperty.all(
                  Size.fromHeight(
                    screenUtil.setHeight(48.0),
                  ),
                )
              : null,
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: screenUtil.setWidth(16.0),
              vertical: screenUtil.setHeight(10.0),
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                4.0,
              ),
              side: BorderSide(
                color: widget.isEnable
                    ? widget.borderColor ?? appColors.primaryColor
                    : appColors.disabledOutlineButtonColor,
              ),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: widget.isEnable
                  ? widget.borderColor ?? appColors.primaryColor
                  : appColors.disabledOutlineButtonColor,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.prefixIcon != null) ...[
              widget.prefixIcon!.getIconImage(
                screenUtil: screenUtil,
              ),
              if (widget.title != null) ...[
                SizedBox(
                  width: screenUtil.setWidth(
                    widget.isFullWidth ? 12.0 : 8.0,
                  ),
                ),
              ],
            ],
            if (widget.title != null) ...[
              Flexible(
                child: widget.isEnable
                    ? widget.title!.getText16W400Text(
                        screenUtil: screenUtil,
                        appColors: appColors,
                      )
                    : widget.title!.getDescriptionText16W400Text(
                        screenUtil: screenUtil,
                        appColors: appColors,
                      ),
              ),
            ],
            if (widget.suffixIcon != null) ...[
              SizedBox(
                width: screenUtil.setWidth(12.0),
              ),
              widget.suffixIcon!.getIconImage(
                screenUtil: screenUtil,
              ),
            ],
          ],
        ),
      ); }*/


class OutLineButton extends BaseScreen {
  final String? title;
  final String? suffixIcon;
  final Color? backgroundColor;
  final Color? buttonTextColor;
  final Color? borderColor;
  final VoidCallback? selectHandler;
  final Widget? prefixIcon;
  final Widget? childWidget;
  final Color? preFixImgColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? verticalPadding;
  final double? fontSize;

  OutLineButton(
      {this.title,
        this.suffixIcon,
        this.backgroundColor,
        this.buttonTextColor,
        this.selectHandler,
        this.borderColor,
        this.prefixIcon,
        this.childWidget,
        this.preFixImgColor,
        this.buttonWidth,
        this.buttonHeight,
        this.fontSize,
        this.verticalPadding});

  @override
  _OutLineButtonState createState() => _OutLineButtonState();
}

class _OutLineButtonState extends BaseScreenState<OutLineButton> {
  @override
  Widget body(BuildContext _) => SizedBox(
    width: widget.buttonWidth ?? double.infinity,
    child: OutlinedButton(
      onPressed: widget.selectHandler,
      style: OutlinedButton.styleFrom(
        backgroundColor:
        widget.backgroundColor ?? appColors.transparentColor,
        disabledBackgroundColor: appColors.disabledPrimaryButtonColor,
        minimumSize: Size(
          screenUtil.setWidth(widget.buttonWidth ?? double.infinity),
          screenUtil.setHeight(widget.buttonHeight ?? 50),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(8.0),
          vertical: screenUtil.setHeight(widget.verticalPadding ?? 10.0),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            7,
          ),
        ),
        side:
        BorderSide(color: widget.borderColor ?? appColors.primaryColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.prefixIcon != null) ...[
            widget.prefixIcon!,
            if (widget.title != null) ...[
              SizedBox(
                width: screenUtil.setWidth(4.0),
              ),
            ],
          ],
          if (widget.title != null) ...[
            Flexible(
              child: widget.title!.getPrimaryButtonText16W400Text(
                screenUtil: screenUtil,
                appColors: appColors,),
            ),
          ],
          if (widget.childWidget != null) ...[widget.childWidget!],
          if (widget.suffixIcon != null) ...[
            SizedBox(
              width: screenUtil.setWidth(12.0),
            ),
            widget.suffixIcon!.getIconImage(
              screenUtil: screenUtil,
            ),
          ],
        ],
      ),
    ),
  );
}

