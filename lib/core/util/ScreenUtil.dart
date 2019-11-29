import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ScreenUtil getScreenUtilInstance(BuildContext context) {
  ScreenUtil.instance =
      ScreenUtil(width: 360.0, height: 640.0, allowFontScaling: true)
        ..init(context);

  return ScreenUtil.getInstance();
}
