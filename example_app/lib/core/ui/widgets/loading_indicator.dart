import 'package:example_app/core/ui/theme/colors/colors_inf.dart';
import 'package:example_app/core/util/screen_util/screen_util.dart';
import 'package:flutter/material.dart';

class CommonCircularProgressIndicator extends StatelessWidget {
  final ScreenUtil screenUtil;
  final ColorsInf appColors;

  const CommonCircularProgressIndicator({
    required this.screenUtil,
    required this.appColors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: screenUtil.setWidth(40.0),
        width: screenUtil.setWidth(40.0),
        child: RepaintBoundary(
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(
              appColors.primaryColor,
            ),
            backgroundColor: appColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
