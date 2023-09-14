import 'package:flutter/material.dart';

import '../../const/app_constants.dart';
import 'screen_util.dart';

ScreenUtil getScreenUtilInstance(BuildContext context) {
  ScreenUtil.init(
    context,
    width: UI_DESIGN_WIDTH,
    height: UI_DESIGN_HEIGHT,
  );
  return ScreenUtil();
}
