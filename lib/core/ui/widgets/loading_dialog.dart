import 'dart:ui';

import 'package:flutter/material.dart';

import '../../util/screen_util/screen_util.dart';
import '../theme/colors/colors_inf.dart';

Future<Widget?> loadingDialog({
  required BuildContext context,
  required ScreenUtil screenUtil,
  required ColorsInf appColors,
}) =>
    showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: appColors.dialogBackgroundColor,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 3,
            sigmaY: 3,
          ),
          child: SimpleDialog(
            elevation: 0,
            backgroundColor: appColors.transparentColor,
            children: [
              Column(
                children: [
                  Container(
                    height: screenUtil.setWidth(80),
                    width: screenUtil.setWidth(80),
                    decoration: ShapeDecoration(
                      color: appColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: appColors.whiteColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: screenUtil.setWidth(40),
                          width: screenUtil.setWidth(40),
                          child: CircularProgressIndicator(
                            backgroundColor: appColors.whiteColor,
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              appColors.primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
