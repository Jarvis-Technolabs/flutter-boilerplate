import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/app_constants.dart';
import '../colors/colors_inf.dart';

///Method format
///get text size fontWeight

///Text
extension TextExtension on String {
  ///12
  Text getText12W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText12W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText12W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText12W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText12W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText12W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///13
  Text getText13W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText13W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText13W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText13W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText13W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText13W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///14
  Text getText14W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText14W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText14W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText14W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText14W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText14W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///15
  Text getText15W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText15W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText15W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText15W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText15W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText15W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///16
  Text getText16W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText16W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText16W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText16W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText16W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText16W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///17
  Text getText17W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText17W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText17W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText17W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText17W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText17W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///18
  Text getText18W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText18W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText18W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText18W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText18W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText18W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///19
  Text getText19W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText19W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText19W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText19W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText19W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText19W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///20
  Text getText20W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText20W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText20W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText20W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText20W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText20W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///21
  Text getText21W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText21W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText21W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText21W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText21W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText21W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///22
  Text getText22W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText22W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText22W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText22W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText22W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText22W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///23
  Text getText23W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText23W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText23W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText23W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText23W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText23W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///24
  Text getText24W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText24W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText24W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText24W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText24W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getText24W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.textColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );
}

///Sub text
extension SubTextExtension on String {
  ///12
  Text getSubText12W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText12W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText12W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText12W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText12W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText12W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///13
  Text getSubText13W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText13W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText13W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText13W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText13W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText13W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///14
  Text getSubText14W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText14W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText14W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText14W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText14W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText14W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///15
  Text getSubText15W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText15W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText15W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText15W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText15W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText15W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///16
  Text getSubText16W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText16W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText16W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText16W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText16W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText16W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///17
  Text getSubText17W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText17W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText17W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText17W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText17W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText17W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///18
  Text getSubText18W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText18W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText18W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText18W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText18W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText18W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///19
  Text getSubText19W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText19W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText19W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText19W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText19W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText19W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///20
  Text getSubText20W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText20W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText20W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText20W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText20W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText20W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///21
  Text getSubText21W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText21W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText21W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText21W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText21W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText21W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///22
  Text getSubText22W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText22W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText22W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText22W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText22W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText22W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///23
  Text getSubText23W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText23W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText23W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText23W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText23W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText23W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///24
  Text getSubText24W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText24W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText24W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText24W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText24W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getSubText24W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );
}

///Description text
extension DescriptionTextExtension on String {
  ///12
  Text getDescriptionText12W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText12W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText12W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText12W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText12W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText12W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(12.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///13
  Text getDescriptionText13W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText13W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText13W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText13W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText13W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText13W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(13.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///14
  Text getDescriptionText14W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText14W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText14W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText14W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText14W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText14W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///15
  Text getDescriptionText15W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText15W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText15W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText15W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText15W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText15W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(15.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///16
  Text getDescriptionText16W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText16W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText16W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText16W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText16W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText16W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///17
  Text getDescriptionText17W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText17W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText17W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText17W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText17W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText17W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(17.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///18
  Text getDescriptionText18W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText18W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText18W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText18W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText18W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText18W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///19
  Text getDescriptionText19W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText19W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText19W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText19W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText19W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText19W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(19.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///20
  Text getDescriptionText20W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText20W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText20W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText20W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText20W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText20W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(20.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///21
  Text getDescriptionText21W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText21W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText21W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText21W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText21W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText21W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(21.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///22
  Text getDescriptionText22W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText22W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText22W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText22W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText22W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText22W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(22.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///23
  Text getDescriptionText23W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText23W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText23W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText23W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText23W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText23W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(23.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  ///24
  Text getDescriptionText24W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText24W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText24W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText24W700Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText24W800Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w800,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getDescriptionText24W900Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.descriptionTextColor,
          fontWeight: FontWeight.w900,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );
}

///Other text
extension OtherTextExtension on String {
  Text getSubText16W500TextWithOutFontFamily({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
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
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
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
          fontFamily: FONT_FAMILY,
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
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: appColors.primaryColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getPrimaryButtonText16W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    Color? textColor,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(16.0),
          color: textColor ?? appColors.primaryColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
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
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(18.0),
          color: appColors.subtextColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign,
      );

  Text getPrimary14W600Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.primaryColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getOutlineCommonButtonText14W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    Color? color,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: color ?? appColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
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

  Text getErrorText14W500Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: getErrorText14W500TextStyle(
          screenUtil: screenUtil,
          appColors: appColors,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getFieldHintText14W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: getFieldHintText14W400TextStyle(
          screenUtil: screenUtil,
          appColors: appColors,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getAppBarTitleText({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(24.0),
          color: appColors.whiteColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );

  Text getPrimaryText14W400Text({
    required ScreenUtil screenUtil,
    required ColorsInf appColors,
    int? maxLine,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: screenUtil.setSp(14.0),
          color: appColors.primaryColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow != null
            ? overflow
            : maxLine != null
                ? TextOverflow.ellipsis
                : null,
      );
}

TextStyle getText16W600TextStyle({
  required ScreenUtil screenUtil,
  required ColorsInf appColors,
}) =>
    TextStyle(
      fontFamily: FONT_FAMILY,
      fontSize: screenUtil.setSp(16.0),
      color: appColors.textColor,
      fontWeight: FontWeight.w600,
    );

TextStyle getErrorText14W500TextStyle({
  required ScreenUtil screenUtil,
  required ColorsInf appColors,
}) =>
    TextStyle(
      fontFamily: FONT_FAMILY,
      fontSize: screenUtil.setSp(14.0),
      color: appColors.errorColor,
      fontWeight: FontWeight.w500,
    );

TextStyle getFieldHintText14W400TextStyle({
  required ScreenUtil screenUtil,
  required ColorsInf appColors,
}) =>
    TextStyle(
      fontFamily: FONT_FAMILY,
      fontSize: screenUtil.setSp(14.0),
      color: appColors.hintColor,
      fontWeight: FontWeight.w400,
    );

TextStyle getOTPTextStyle(ColorsInf appColors, ScreenUtil screenUtil) =>
    TextStyle(
      fontFamily: FONT_FAMILY,
      height: 1.4,
      fontSize: screenUtil.setSp(24.0),
      color: appColors.textColor,
      fontWeight: FontWeight.w700,
    );
