import 'package:flutter/material.dart';

class AppColor {
  ///Primary color
  static Color primaryColor = Color(0xFF6750a4);
  static Color darkPrimaryColor = Color(0xFF6750a4);

  ///Ink/Splash color
  static Color inkColor = Colors.black.withOpacity(0.1);
  static Color darkInkColor = Colors.black.withOpacity(0.1);

  ///Screen background color
  static Color screenBgColor = Color(0xFFFFFFFF);
  static Color darkScreenBgColor = Color(0xFF000000);

  ///Text colors
  static const Color textColor = Color(0xFF282828);
  static const Color darkTextColor = Color(0xFF282828);
  static Color subtextColor = Color(0xFF4D4D4D);
  static Color darkSubtextColor = Color(0xFF4D4D4D);
  static Color descriptionTextColor = Color(0xFF808080);
  static Color darkDescriptionTextColor = Color(0xFF808080);
  static Color hintTextColor = Color(0xFF808080);
  static Color darkHintTextColor = Color(0xFF808080);
  static Color cursorColor = Color(0xFF808080);
  static Color darkCursorColor = Color(0xFF808080);
  static Color textSelectionHandlerColor = Color(0xFF808080);
  static Color darkTextSelectionHandlerColor = Color(0xFF808080);

  /// Switch colors
  static Color switchThumbColor = Color(0xFFE5E5E5).withOpacity(0.6);
  static Color darkSwitchThumbColor = Color(0xFFE5E5E5).withOpacity(0.6);

  ///Dialog background color
  static Color dialogBackgroundColor = Color(0xFFE5E5E5).withOpacity(0.6);
  static Color darkDialogBackgroundColor = Color(0xFFE5E5E5).withOpacity(0.6);

  ///Divider border color
  static Color dividerColor = blackColor.withOpacity(0.1);
  static Color darkDividerColor = blackColor.withOpacity(0.1);

  ///Box background color
  static Color boxBackgroundColor = whiteColor.withOpacity(0.6);
  static Color darkBoxBackgroundColor = whiteColor.withOpacity(0.6);

  ///Transparent color
  static Color transparentColor = Colors.transparent;
  static Color darkTransparentColor = Colors.transparent;

  static Color disabledPrimaryButtonColor = primaryColor.withOpacity(0.5);
  static Color darkDisabledPrimaryButtonColor = primaryColor.withOpacity(0.5);

  ///Disabled outline color
  static Color disabledOutlineButtonColor = Color(0xFF808080);
  static Color darkDisabledOutlineButtonColor = Color(0xFF808080);

  ///Secondary Color
  static Color secondaryColor = Color(0xFF282828).withOpacity(0.2);
  static Color darkSecondaryColor = Color(0xFF282828).withOpacity(0.2);

  ///Shimmer colors E1E1E1 E0E0E0 F5F5F5
  static Color shimmerBaseColor = dialBgColor;
  static Color darkShimmerBaseColor = dialBgColor;
  static Color shimmerHighlightColor = whiteColor;
  static Color darkShimmerHighlightColor = darkWhiteColor;

  ///Checkbox  colors
  static Color checkBoxCheckColor = whiteColor;
  static Color darkCheckBoxCheckColor = whiteColor;
  static Color checkBoxFillColor = primaryColor;
  static Color darkCheckBoxFillColor = primaryColor;

  ///radio  colors

  static Color radioFillColor = primaryColor;
  static Color darkRadioFillColor = primaryColor;

  /// Floating action button colors
  static Color fabBgColor = primaryColor;
  static Color darkFabBgColor = primaryColor;

  ///Extra colors
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color darkWhiteColor = Color(0xFFFFFFFF);
  static Color blackColor = Color(0xFF000000);
  static const Color dialBgColor = Color(0xffF3F3F3);
  static const Color darkDialBgColor = Color(0xffF3F3F3);
  static const Color inactiveSteeperColor = Color(0xFFE1E1E4);
  static const Color darkInactiveSteeperColor = Color(0xFFE1E1E4);
  static Color scrollbarColor = Color(0xFF282828).withOpacity(0.4);
  static Color darkScrollbarColor = Color(0xFF282828).withOpacity(0.4);
  static Color blueDoneKeyboardTextColor = Colors.blueAccent;
  static Color redColor = Color(0xFFF50505);
}
