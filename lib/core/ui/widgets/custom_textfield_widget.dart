import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/core/ui/theme/colors/colors_inf.dart';
import 'package:flutter_clean_architecture/core/ui/theme/text_extension/text_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../base/screen/base_screen.dart';
import '../../util/input_formatter/no_leading_space_formatter.dart';

class CustomTextFieldWidget extends BaseScreen {
  final TextEditingController? controller;
  final bool isObscure;
  final bool? isMandatoryField;
  final String hintText;
  final String labelText;
  final String? errorText;
  final Widget? suffixIconWidget;
  final Widget? prefixIconWidget;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final int? inputFormatters;
  final String? inputFormatterRegex;
  final bool? autocorrect;
  final bool? enabled;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextStyle? textStyle;
  final bool enableSuggestions;
  final bool autoFocus;
  final int minLines;
  final int errorMaxLine;

  CustomTextFieldWidget({
    this.controller,
    this.isObscure = false,
    required this.hintText,
    required this.labelText,
    this.errorText,
    this.inputFormatterRegex,
    this.suffixIconWidget,
    this.prefixIconWidget,
    this.focusNode,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines = 1,
    this.errorMaxLine = 2,
    this.autocorrect = false,
    this.autoFocus = false,
    this.readOnly = false,
    this.enabled = true,
    this.isMandatoryField = false,
    this.onTap,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.textInputAction,
    this.enableSuggestions = true,
    this.textCapitalization = TextCapitalization.none,
    this.textStyle,
  });

  @override
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState
    extends BaseScreenState<CustomTextFieldWidget> {
  FocusNode focusNode = FocusNode();
  @override
  Widget body(_) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: widget.labelText.getText16W600Text(
                  screenUtil: screenUtil,
                  appColors: appColors,
                  maxLine: 2,
                ),
              ),
              widget.isMandatoryField == true
                  ? "*"
                      .getText16W600Text(
                        screenUtil: screenUtil,
                        appColors: appColors,
                      )
                      .paddingOnly(
                        screenUtil,
                        paddingLeft: 5,
                      )
                  : SizedBox.shrink()
            ],
          ).paddingOnly(
            screenUtil,
            paddingBottom: 7,
          ),
          TextFormField(
            scrollPadding: EdgeInsets.only(
              bottom: 45,
            ),
            controller: widget.controller,
            style: widget.textStyle ??
                getText16W600TextStyle(
                  screenUtil: screenUtil,
                  appColors: appColors,
                ),
            obscureText: widget.isObscure,
            focusNode: widget.focusNode ?? focusNode,
            autocorrect: widget.autocorrect!,
            keyboardType: widget.keyboardType,
            readOnly: widget.readOnly,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            textAlignVertical: TextAlignVertical.center,
            onTap: widget.onTap,
            validator: widget.validator,
            maxLength: widget.maxLength,
            enabled: widget.enabled,
            autofocus: widget.autoFocus,
            enableSuggestions: widget.enableSuggestions,
            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.inputFormatters),
              if (widget.inputFormatterRegex != null) ...[
                FilteringTextInputFormatter.allow(
                  RegExp(
                    widget.inputFormatterRegex!,
                  ),
                ),
              ],
              FilteringTextInputFormatter.deny('  '),
              NoLeadingSpaceFormatter(),
            ],
            textInputAction: widget.textInputAction,
            textCapitalization: widget.textCapitalization!,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(
                screenUtil.setWidth(15),
                screenUtil.setHeight(15),
                screenUtil.setWidth(15),
                screenUtil.setHeight(15),
              ),
              hintText: widget.hintText,
              suffixIcon: widget.suffixIconWidget,
              prefixIcon: widget.prefixIconWidget,
              errorMaxLines: widget.errorMaxLine,
              hintStyle: getFieldHintText14W400TextStyle(
                screenUtil: screenUtil,
                appColors: appColors,
              ),
              errorStyle: getErrorText14W500TextStyle(
                screenUtil: screenUtil,
                appColors: appColors,
              ),
              filled: true,
              fillColor: appColors.transparentColor,
              border: InputBorder.none,
              enabledBorder: outlineInputBorder(
                appColors: appColors,
                screenUtil: screenUtil,
              ),
              focusedBorder: outlineInputBorder(
                borderColor: appColors.primaryColor,
                appColors: appColors,
                screenUtil: screenUtil,
              ),
              errorBorder: outlineInputBorder(
                borderColor: appColors.errorColor,
                appColors: appColors,
                screenUtil: screenUtil,
              ),
              disabledBorder: outlineInputBorder(
                appColors: appColors,
                screenUtil: screenUtil,
              ),
              focusedErrorBorder: outlineInputBorder(
                borderColor: appColors.errorColor,
                appColors: appColors,
                screenUtil: screenUtil,
              ),
              counterText: "",
            ),
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            onEditingComplete: widget.onEditingComplete,
          ).paddingOnly(
            screenUtil,
            paddingBottom: 7,
          ),
          (widget.errorText != "" && widget.errorText != null)
              ? widget.errorText!.getErrorText14W500Text(
                  screenUtil: screenUtil,
                  appColors: appColors,
                  maxLine: 4,
                )
              : SizedBox.shrink(),
        ],
      ).doneKeyBoard(
        screenUtil: screenUtil,
        appColors: appColors,
        context: context,
        node: widget.focusNode ?? focusNode,
      );
}

OutlineInputBorder? outlineInputBorder({
  required ScreenUtil screenUtil,
  Color? borderColor,
  required ColorsInf appColors,
}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(screenUtil.setWidth(10)),
        topRight: Radius.circular(screenUtil.setWidth(10)),
        bottomLeft: Radius.circular(screenUtil.setWidth(10)),
        bottomRight: Radius.circular(screenUtil.setWidth(10)),
      ),
      borderSide: BorderSide(
        color: borderColor ?? appColors.dividerColor,
        width: screenUtil.setWidth(1.5),
      ),
    );
