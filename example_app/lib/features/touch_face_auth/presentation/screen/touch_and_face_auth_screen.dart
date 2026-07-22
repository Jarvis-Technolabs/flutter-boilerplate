import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as local_auth_error;
import 'package:local_auth/local_auth.dart';

import '../../../../../core/const/string_constants.dart';
import '../../../../core/localizations/localization_extension.dart';
import '../../../../core/ui/widgets/button.dart';

class TouchAndFaceAuthScreen extends BaseBlocWidget {
  @override
  State<TouchAndFaceAuthScreen> createState() => _TouchAndFaceAuthScreenState();
}

class _TouchAndFaceAuthScreenState
    extends BaseBlocWidgetState<TouchAndFaceAuthScreen> {
  /// initialize LocalAuthentication
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  /// Authenticate using biometrics(TouchID/FaceId)
  Future<void> authenticateUser() async {
    bool isAuthorized = false;

    /// check biometric supported or not
    bool isBioMetricSupported = await _localAuthentication.isDeviceSupported();

    /// return list of enrolled biometrics
    List<BiometricType> availableBiometrics =
        await _localAuthentication.getAvailableBiometrics();

    if (isBioMetricSupported && availableBiometrics.isNotEmpty) {
      try {
        isAuthorized = await _localAuthentication.authenticate(
          localizedReason: context.tr(
            LABEL_PLEASE_AUTHENTICATE,
          ),
          options: const AuthenticationOptions(
            biometricOnly: true,
          ),
        );
        if (isAuthorized) {
          commonUtilities.showToast(
            message: context.tr(LABEL_AUTH_SUCCESS),
            backgroundColors: appColors.blackColor,
            textColors: appColors.whiteColor,
          );
        }
      } on PlatformException catch (exception) {
        /// handle exceptions
        if (exception.code == local_auth_error.notAvailable ||
            exception.code == local_auth_error.passcodeNotSet ||
            exception.code == local_auth_error.notEnrolled) {
          commonUtilities.showToast(
            message: context.tr(LABEL_AUTH_FAILURE),
            backgroundColors: appColors.blackColor,
            textColors: appColors.whiteColor,
          );
        }
      }
    } else {
      /// biometric are not supported or enrolled
      commonUtilities.showToast(
        message: context.tr(LABEL_AUTH_FAILURE),
        backgroundColors: appColors.blackColor,
        textColors: appColors.whiteColor,
      );
    }
  }

  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_TOUCH_FACE_AUTH)
              .getWhiteColor17W500Inter(
                  screenUtil: screenUtil, appColors: appColors),
        ),
        body: Center(
          child: PrimaryButton(
            title: context.tr(LABEL_TOUCH_ID),
            backgroundColor: appColors.primaryColor,
            buttonTextColor: appColors.whiteColor,
            selectHandler: () => authenticateUser(),
          )
              .paddingOnly(
                screenUtil,
                paddingBottom: 30,
              )
              .paddingAll(padding: 20, screenUtil: screenUtil),
        ),
      );
}
