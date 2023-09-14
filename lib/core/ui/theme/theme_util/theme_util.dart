import 'package:flutter/material.dart';

import '../../../const/app_constants.dart';
import '../colors/colors_inf.dart';

class ThemeUtil {
  /// Light theme
  static ThemeData getLightTheme({
    required BuildContext context,
    required ColorsInf appColors,
  }) =>
      ThemeData(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(appColors.scrollbarColor),
        ),
        fontFamily: MULISH_REGULAR_FONT_FAMILY,
        primaryColor: appColors.primaryColor,
        useMaterial3: USE_MATERIAL_3,
        scaffoldBackgroundColor: appColors.screenBgColor,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              color: appColors.primaryColor,
            ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: appColors.secondaryColor,
          brightness: Theme.of(context).brightness,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: appColors.cursorColor,
          selectionHandleColor: appColors.textSelectionHandlerColor,
        ),
        hintColor: appColors.hintColor,
        dialogBackgroundColor: appColors.dialogBackgroundColor,
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(appColors.checkBoxCheckColor),
          fillColor: MaterialStateProperty.all(appColors.checkBoxFillColor),
        ),
        dividerColor: appColors.dividerColor,
        timePickerTheme: _buildTimePickerThemeData(appColors: appColors),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(appColors.radioFillColor),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: appColors.fabBgColor),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(appColors.switchThumbColor),
        ),
      );

  /// Dark theme
  static ThemeData getDarkTheme({
    required BuildContext context,
    required ColorsInf appColors,
  }) =>
      ThemeData(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(appColors.scrollbarColor),
        ),
        fontFamily: MULISH_REGULAR_FONT_FAMILY,
        primaryColor: appColors.primaryColor,
        useMaterial3: USE_MATERIAL_3,
        scaffoldBackgroundColor: appColors.screenBgColor,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              color: appColors.primaryColor,
            ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: appColors.secondaryColor,
          brightness: Theme.of(context).brightness,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: appColors.cursorColor,
          selectionHandleColor: appColors.textSelectionHandlerColor,
        ),
        hintColor: appColors.hintColor,
        dialogBackgroundColor: appColors.dialogBackgroundColor,
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(appColors.checkBoxCheckColor),
          fillColor: MaterialStateProperty.all(appColors.checkBoxFillColor),
        ),
        dividerColor: appColors.dividerColor,
        timePickerTheme: _buildTimePickerThemeData(appColors: appColors),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(appColors.radioFillColor),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: appColors.fabBgColor),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(appColors.switchThumbColor),
        ),
      );

  /// Time picker theme
  static TimePickerThemeData _buildTimePickerThemeData({
    required ColorsInf appColors,
  }) =>
      TimePickerThemeData(
        backgroundColor: appColors.screenBgColor,
        hourMinuteShape: const RoundedRectangleBorder(

          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        dayPeriodColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? appColors.primaryColor.withOpacity(0.1)
            : appColors.screenBgColor),
        dayPeriodTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? appColors.primaryColor
            : appColors.textColor),
        dayPeriodShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        dayPeriodBorderSide: BorderSide.none,
        hourMinuteColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? appColors.primaryColor.withOpacity(0.1)
            : appColors.screenBgColor),
        hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? appColors.primaryColor
            : appColors.textColor),
        dialHandColor: appColors.primaryColor,
        dialBackgroundColor: appColors.screenBgColor,
        hourMinuteTextStyle: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          fontFamily: MULISH_REGULAR_FONT_FAMILY,
        ),
        dayPeriodTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: MULISH_REGULAR_FONT_FAMILY,
        ),
        helpTextStyle:  TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: appColors.textColor,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),

        ),
        dialTextColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected)
              ? appColors.whiteColor
              : appColors.textColor,
        ),
        entryModeIconColor: appColors.textColor,
      );
}
