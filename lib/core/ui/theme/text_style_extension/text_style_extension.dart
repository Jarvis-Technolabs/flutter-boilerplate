import 'package:flutter/material.dart';

import '../../../const/app_constants.dart';
import '../../../util/screen_util/screen_util.dart';
import '../colors/app_color.dart';
import '../colors/colors_inf.dart';

extension TextStyles on String {

  ///get color size fontWeight font-family

  Text getText16W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: MULISH_REGULAR_FONT_FAMILY,
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
          fontFamily: MULISH_REGULAR_FONT_FAMILY,
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
          fontFamily: MULISH_REGULAR_FONT_FAMILY,
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
          fontFamily: MULISH_REGULAR_FONT_FAMILY,
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
          fontFamily: MULISH_REGULAR_FONT_FAMILY,
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
          fontFamily: MULISH_REGULAR_FONT_FAMILY,
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
          fontFamily: MULISH_REGULAR_FONT_FAMILY,
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
          fontFamily: MULISH_REGULAR_FONT_FAMILY,
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
          fontFamily: MULISH_REGULAR_FONT_FAMILY,
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
          fontFamily: MULISH_REGULAR_FONT_FAMILY,
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
          fontFamily: MULISH_REGULAR_FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: color ?? appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      );
}
