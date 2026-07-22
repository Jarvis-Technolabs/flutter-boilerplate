import 'package:flutter/material.dart';

class AppColor {
  ///Primary color
  static Color primaryColor = Color(0xFF9775FA);
  static Color darkPrimaryColor = primaryColor;

  ///Screen background color
  static Color screenBgColor = Color(0xFFF5F6FA);
  static Color darkScreenBgColor = Color(0xFF1B262C);

  ///Text colors
  static const Color textColor = Color(0xFF1D1E20);
  static const Color darkTextColor = Color(0xFFF5F8FB);

  static Color subtextColor = Color(0xFF8F959E);
  static Color darkSubtextColor = Color(0xFF8F959E);

  static Color descriptionTextColor = Color(0xFF8F959E);
  static Color darkDescriptionTextColor = Color(0xFF8F959E);

  static Color hintTextColor = Color(0xFF8F959E);
  static Color darkHintTextColor = Color(0xFF8F959E);

  static Color cursorColor = primaryColor;
  static Color darkCursorColor = Color(0xFFF5F6FA);

  static Color textSelectionHandlerColor = Color(0xFF8F959E);
  static Color darkTextSelectionHandlerColor = Color(0xFF8F959E);

  /// Switch colors
  static Color switchThumbColor = primaryColor;
  static Color darkSwitchThumbColor = primaryColor;

  ///Dialog background color
  static Color dialogBackgroundColor = Color(0xFFFFFFFF);
  static Color darkDialogBackgroundColor = Color(0xFF29363D);

  ///Divider border color
  static Color dividerColor = Color(0xFFE7E8EA);
  static Color darkDividerColor = Color(0xFFE7E8EA);

  ///Transparent color
  static Color transparentColor = Colors.transparent;
  static Color darkTransparentColor = Colors.transparent;

  ///Disabled Primary color

  static Color disabledPrimaryButtonColor = primaryColor.withOpacity(0.3);
  static Color darkDisabledPrimaryButtonColor =
      darkPrimaryColor.withOpacity(0.3);

  ///Disabled outline color
  static Color disabledOutlineButtonColor = Color(0xFF8F959E);
  static Color darkDisabledOutlineButtonColor = Color(0xFF8F959E);

  ///Shimmer colors E1E1E1 E0E0E0 F5F5F5
  static Color shimmerBaseColor = Color(0xFF8F959E).withOpacity(0.4);
  static Color darkShimmerBaseColor = Color(0xFF8F959E).withOpacity(0.4);

  static Color shimmerHighlightColor = Color(0xFFFFFFFF);
  static Color darkShimmerHighlightColor = Color(0xFFFFFFFF);

  ///Checkbox  colors
  static Color checkBoxCheckColor = Color(0xFFFFFFFF);
  static Color darkCheckBoxCheckColor = Color(0xFFFFFFFF);

  static Color checkBoxFillColor = primaryColor;
  static Color darkCheckBoxFillColor = primaryColor;

  ///radio  colors
  static Color radioFillColor = primaryColor;
  static Color darkRadioFillColor = primaryColor;

  /// Floating action button colors
  static Color fabBgColor = primaryColor;
  static Color darkFabBgColor = primaryColor;

  /// Scrollbar color
  static Color scrollbarColor = Color(0xFF8F959E).withOpacity(0.4);
  static Color darkScrollbarColor = Color(0xFF8F959E).withOpacity(0.4);

  ///Secondary Color
  static Color secondaryColor = primaryColor.withOpacity(0.4);
  static Color darkSecondaryColor = primaryColor.withOpacity(0.4);

  ///Extra colors
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color darkWhiteColor = Color(0xFFFFFFFF);

  static Color blackColor = Color(0xFF000000);
  static Color darkBlackColor = Color(0xFF000000);

  static Color redColor = Color(0xFFF50505);
  static Color darkRedColor = Color(0xFFF50505);

  static Color grayColor = Colors.grey;
  static Color blueDoneKeyboardTextColor = Colors.blueAccent;
}
