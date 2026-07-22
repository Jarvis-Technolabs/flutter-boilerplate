import 'dart:async';

import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/features/sensitive_info/widget/secure_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/const/string_constants.dart';
import '../../../core/localizations/app_localizations.dart';
import '../../../core/localizations/localization_extension.dart';

class SensitiveInfoScreen extends BaseBlocWidget {
  @override
  State<SensitiveInfoScreen> createState() => _SensitiveInfoScreenState();
}

class _SensitiveInfoScreenState
    extends BaseBlocWidgetState<SensitiveInfoScreen> {
  bool showLoader = false;

  dynamic info = {
    "id": 1,
    "cardNumber": "4242 4242 4242 42424",
    "phoneNumber": "+91 1234567890",
    "NmeOnCard": "Test Name"
  };

  StreamController<bool> refreshLoaderState =
      StreamController<bool>.broadcast();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          foregroundColor: appColors.whiteColor,
          title: Text(context.tr(LABEL_SENSITIVE_INFO_BLUR_BACKGROUND)),
        ),
        body: Center(child: showInfoWidget()),
      );

  showInfoWidget() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Text(
                  "Card Numbur",
                  style: TextStyle(
                      color: appColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                SecureWidgetPage(
                  child: Text(
                    info["cardNumber"],
                    style: TextStyle(
                        color: appColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenUtil.setHeight(8),
            ),
            Row(
              children: [
                Text(
                  "Phone Number",
                  style: TextStyle(
                      color: appColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                SecureWidgetPage(
                  child: Text(
                    info["phoneNumber"],
                    style: TextStyle(
                        color: appColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenUtil.setHeight(8),
            ),
            Row(
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                      color: appColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                SecureWidgetPage(
                  child: Text(
                    info["NmeOnCard"],
                    style: TextStyle(
                        color: appColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenUtil.setHeight(12),
            ),
          ],
        ),
      );
}
