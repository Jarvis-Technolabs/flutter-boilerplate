import 'package:flutter/material.dart';

import '../../../const/app_constants.dart';
import '../../../util/screen_util/screen_util.dart';
import '../colors/app_color.dart';
import '../colors/colors_inf.dart';

extension TextStyles on String {
  ///get color size fontWeight font-family

  Text getTextColor28W600Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(28.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getTextColor15W500Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getTextColor13W500Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getRedColor13W500Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.redColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getTextColor15W400Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getTextColor17W500Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getTextColor17W600Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getTextColor11W500Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(11.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getSubTextColor15W400Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getSubTextColor13W500Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getSubTextColor13W400Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getSubTextColor17W500Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getSubTextColor11W500Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(11.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getWhiteColor17W500Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.whiteColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getWhiteColor14W400Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.whiteColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getBlackColor17W500Inter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.blackColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getFormTextInter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: getFormTextStyle(screenUtil: screenUtil, appColors: appColors),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getFormHintTextInter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style:
            getFormHintTextStyle(screenUtil: screenUtil, appColors: appColors),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getFormErrorTextInter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style:
            getFormErrorTextStyle(screenUtil: screenUtil, appColors: appColors),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getFormLabelTextInter({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style:
            getFormLabelTextStyle(screenUtil: screenUtil, appColors: appColors),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  /// ================================================================================================== ///
  /// ================================================================================================== ///

  Text getText16W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getSubText16W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getSubText16W500TextWithOutFontFamily({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontSize: screenUtil.setSp(16.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getSubtext16W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine = 1,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow = TextOverflow.ellipsis,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow,
      );

  Text getPrimarySubtext16W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.primaryColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getDescriptionText16W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getPrimaryButtonText16W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    Color? textColor,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: textColor ?? appColors.whiteColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getText18W700Text({
    required ScreenUtil screenUtil,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
    Color color = AppColor.textColor,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: color,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getSubText18W500WithLineHeightText({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          height: 1.4,
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
      );

  Text getText20W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getPrimary14W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.primaryColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getOutlineCommonButtonText14W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    Color? color,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: INTER_FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: color ?? appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );

  Text getDoneText({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
  }) =>
      Text(
        this,
        style: TextStyle(
          color: appColors.keyboardDoneColor,
          fontSize: screenUtil.setSp(16),
          letterSpacing: 0.3,
          fontWeight: FontWeight.w700,
          fontFamily: "Roboto",
        ),
      );
}

/// Text Style

TextStyle getFormHintTextStyle(
        {required ScreenUtil screenUtil, required ColorsInf appColors}) =>
    TextStyle(
      fontFamily: INTER_FONT_FAMILY,
      fontSize: screenUtil.setSp(15.0),
      color: appColors.subtextColor,
      fontWeight: FontWeight.w400,
    );

TextStyle getFormErrorTextStyle(
        {required ScreenUtil screenUtil, required ColorsInf appColors}) =>
    TextStyle(
      fontFamily: INTER_FONT_FAMILY,
      fontSize: screenUtil.setSp(15.0),
      color: appColors.redColor,
      fontWeight: FontWeight.w400,
    );

TextStyle getFormTextStyle(
        {required ScreenUtil screenUtil, required ColorsInf appColors}) =>
    TextStyle(
      fontFamily: INTER_FONT_FAMILY,
      fontSize: screenUtil.setSp(15.0),
      color: appColors.textColor,
      fontWeight: FontWeight.w500,
    );

TextStyle getFormLabelTextStyle(
        {required ScreenUtil screenUtil, required ColorsInf appColors}) =>
    TextStyle(
      fontFamily: INTER_FONT_FAMILY,
      fontSize: screenUtil.setSp(15.0),
      color: appColors.textColor,
      fontWeight: FontWeight.w500,
    );

TextStyle getSelectedBottomNavigationItemLabelStyle(
        {required ScreenUtil screenUtil, required ColorsInf appColors}) =>
    TextStyle(
      fontFamily: INTER_FONT_FAMILY,
      fontSize: screenUtil.setSp(16.0),
      color: appColors.whiteColor,
      fontWeight: FontWeight.w500,
    );

TextStyle getUnSelectedBottomNavigationItemLabelStyle(
        {required ScreenUtil screenUtil, required ColorsInf appColors}) =>
    TextStyle(
      fontFamily: INTER_FONT_FAMILY,
      fontSize: screenUtil.setSp(16.0),
      color: appColors.whiteColor.withOpacity(0.4),
      fontWeight: FontWeight.w400,
    );

TextStyle getPrimaryColor15W500underLineTextStyle({
  required ScreenUtil screenUtil,
  required ColorsInf appColors,
}) =>
    TextStyle(
        decoration: TextDecoration.underline,
        decorationColor: appColors.primaryColor,
        color: appColors.primaryColor,
        fontWeight: FontWeight.w600,
        decorationThickness: 1,
        decorationStyle: TextDecorationStyle.solid,
        fontSize: screenUtil.setSp(15),
        fontFamily: INTER_FONT_FAMILY);

TextStyle getSubTextColor15W500underLineTextStyle(
        {required ScreenUtil screenUtil, required ColorsInf appColors}) =>
    TextStyle(
        decoration: TextDecoration.underline,
        decorationColor: appColors.subtextColor,
        color: appColors.subtextColor,
        fontWeight: FontWeight.w600,
        decorationThickness: 1,
        decorationStyle: TextDecorationStyle.solid,
        fontSize: screenUtil.setSp(15),
        fontFamily: INTER_FONT_FAMILY);
