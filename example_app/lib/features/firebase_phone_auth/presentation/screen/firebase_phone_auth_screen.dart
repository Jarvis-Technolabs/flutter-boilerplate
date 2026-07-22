import 'dart:async';

import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/features/firebase_phone_auth/presentation/bloc/phone_auth_bloc.dart';
import 'package:example_app/features/firebase_phone_auth/presentation/bloc/phone_auth_event.dart';
import 'package:example_app/features/firebase_phone_auth/presentation/bloc/phone_auth_state.dart';
import 'package:example_app/features/firebase_phone_auth/presentation/screen/verify_otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../core/const/string_constants.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/localizations/localization_extension.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/ui/widgets/button.dart';
import '../../../../core/ui/widgets/custom_textfield_widget.dart';
import '../../../../core/ui/widgets/phone_code_picker_textfield.dart';

class FirebasePhoneAuthScreen extends BaseBlocWidget {
  @override
  State<FirebasePhoneAuthScreen> createState() =>
      _FirebasePhoneAuthScreenState();
}

class _FirebasePhoneAuthScreenState
    extends BaseBlocWidgetState<FirebasePhoneAuthScreen> {
  TextEditingController _phoneNoTextEditingController = TextEditingController();
  late String verificationId;
  late PhoneNumber number;
  late String otp, authStatus = "";
  StreamController<bool> _isVerifyEnabledStreamController =
      StreamController.broadcast();

  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_FIREBASE_PHONE_AUTHENTICATION)
              .getWhiteColor17W500Inter(
                screenUtil: screenUtil,
                appColors: appColors,
              ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PhoneCodePickerTextField(
              controller: _phoneNoTextEditingController,
              languageCode: 'en', // language code
              initialCountryCode: "IN", // initial countryCode
              onPhoneNumberChange: (phoneNumber) {
                /// Implement logic for when user enter valid or invalid number
                if (phoneNumber.isValidNumber()) {
                  number = phoneNumber;
                  _isVerifyEnabledStreamController.add(true);
                } else {
                  _isVerifyEnabledStreamController.add(false);
                }
              },
              labelText:
              context.tr(LABEL_PHONE_NUMBER),
              isMandatoryField: true,
              inputDecoration: InputDecoration(
                helperText: "",
                contentPadding: EdgeInsets.fromLTRB(
                  screenUtil.setWidth(0),
                  screenUtil.setHeight(18),
                  screenUtil.setWidth(15),
                  screenUtil.setHeight(18),
                ),
                hintText:
                context.tr(LABEL_PHONE_NUMBER),
                errorMaxLines: 2,
                hintStyle: getFormHintTextStyle(
                  screenUtil: screenUtil,
                  appColors: appColors,
                ),
                filled: true,
                fillColor: appColors.transparentColor,
                border: InputBorder.none,
                errorStyle: getFormErrorTextStyle(
                  screenUtil: screenUtil,
                  appColors: appColors,
                ),
                enabledBorder: outlineInputBorder(
                  appColors: appColors,
                  screenUtil: screenUtil,
                ),
                focusedBorder: outlineInputBorder(
                  borderColor: appColors.primaryColor,
                  appColors: appColors,
                  screenUtil: screenUtil,
                ),
                errorBorder: outlineInputBorder(
                  borderColor: appColors.dividerColor,
                  appColors: appColors,
                  screenUtil: screenUtil,
                ),
                disabledBorder: outlineInputBorder(
                  appColors: appColors,
                  screenUtil: screenUtil,
                ),
                focusedErrorBorder: outlineInputBorder(
                  appColors: appColors,
                  screenUtil: screenUtil,
                ),
              ),
            ).paddingOnly(screenUtil, paddingBottom: 15),
            BlocConsumer<PhoneAuthBloc, PhoneAuthState>(
              listener: (context, state) {
                if (state is PhoneAuthSuccessState) {
                  /// navigate to OTP verification page
                  navigatePush(
                      context,
                      VerifyOtpPage(
                        verificationID: state.response.verificationID,
                        phoneNo: number.completeNumber,
                        resendOtpToken: state.response.resendOtpToken,
                      ));
                }
              },
              builder: (context, state) {
                return StreamBuilder<bool>(
                    stream: _isVerifyEnabledStreamController.stream,
                    initialData: false,
                    builder: (context, snapshot) {
                      bool isEnabled = snapshot.data!;
                      return PrimaryButton(
                        title: context.tr(LABEL_VERIFY),
                        backgroundColor: appColors.primaryColor,
                        buttonTextColor: appColors.whiteColor,
                        selectHandler: isEnabled
                            ? () => verifyPhoneNumberWithFirebase(
                                  phoneNumber: number,
                                )
                            : null,
                      );
                    });
              },
            )
          ],
        ).paddingAll(
          padding: 20,
          screenUtil: screenUtil,
        ),
      );

  /// call phone authentication bloc event
  Future<void> verifyPhoneNumberWithFirebase(
      {required PhoneNumber phoneNumber}) async {
    BlocProvider.of<PhoneAuthBloc>(context).add(
      FetchPhoneAuthOtpEvent(
        phoneNumber: phoneNumber.completeNumber,
      ),
    );
  }
}
