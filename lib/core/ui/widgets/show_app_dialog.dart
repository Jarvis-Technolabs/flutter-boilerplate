import 'dart:ui';

import 'package:flutter/material.dart';

import '../../util/screen_util/screen_util.dart';
import '../theme/colors/colors_inf.dart';

Future<T?> showAppDialog<T>({
  required BuildContext context,
  required ColorsInf appColors,
  required ScreenUtil screenUtil,
  required Widget child,
  bool barrierDismissible = true,
}) async =>
    await showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      barrierColor: appColors.dialogBackgroundColor,
      builder: (BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
        ),
        child: Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.symmetric(
            horizontal: screenUtil.setWidth(16.0),
            vertical: screenUtil.setHeight(16.0),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: appColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(
                    0,
                    screenUtil.setHeight(10.0),
                  ),
                  color: appColors.blackColor.withOpacity(0.1),
                  blurRadius: 24.0,
                ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );

Future<T?> showTrackMateBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  required ColorsInf appColors,
  bool isScrollable = false,
  required ScreenUtil screenUtil,
}) async =>
    await showModalBottomSheet(
      context: context,
      barrierColor: appColors.dialogBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(4.0),
        ),
      ),
      isScrollControlled: isScrollable,
      builder: (_) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: appColors.whiteColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(
                  0,
                  screenUtil.setHeight(10.0),
                ),
                color: appColors.blackColor.withOpacity(0.1),
                blurRadius: 20.0,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
