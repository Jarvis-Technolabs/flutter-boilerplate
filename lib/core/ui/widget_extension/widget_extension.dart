import 'package:flutter/material.dart';

import '../../util/screen_util/screen_util.dart';

extension WidgetExtension on Widget {
  ///Apply all padding
  Widget paddingAll({
    required double padding,
    required ScreenUtil screenUtil,
  }) =>
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          screenUtil.setWidth(padding),
          screenUtil.setHeight(padding),
          screenUtil.setWidth(padding),
          screenUtil.setHeight(padding),
        ),
        child: this,
      );

  ///Apply symmetric padding
  Widget paddingSymmetric({
    double horizontalPadding = 0.0,
    double verticalPadding = 0.0,
    required ScreenUtil screenUtil,
  }) =>
      Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: screenUtil.setWidth(horizontalPadding),
          vertical: screenUtil.setHeight(verticalPadding),
        ),
        child: this,
      );

  ///Apply padding for specific side
  Widget paddingOnly(
    ScreenUtil screenUtil, {
    double paddingTop = 0,
    double paddingBottom = 0,
    double paddingLeft = 0,
    double paddingRight = 0,
  }) =>
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          screenUtil.setWidth(paddingLeft),
          screenUtil.setHeight(paddingTop),
          screenUtil.setWidth(paddingRight),
          screenUtil.setHeight(paddingBottom),
        ),
        child: this,
      );
}
