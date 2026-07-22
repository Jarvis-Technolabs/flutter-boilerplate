import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/app_constants.dart';

ScreenUtil getScreenUtilInstance(BuildContext context) {
  final Size screenSize = MediaQuery.sizeOf(context);
  final bool isTablet = screenSize.shortestSide >= TABLET_DEVICE_WIDTH;
  final Size designSize = isTablet
      ? screenSize
      : const Size(
    UI_DESIGN_WIDTH,
    UI_DESIGN_HEIGHT,
  );

  ScreenUtil.init(
    context,
    minTextAdapt: true,
    splitScreenMode: true,
    designSize: designSize,
  );
  return ScreenUtil();
}
