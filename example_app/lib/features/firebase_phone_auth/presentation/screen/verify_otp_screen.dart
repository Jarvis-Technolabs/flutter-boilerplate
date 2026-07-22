import 'dart:async';

import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/features/firebase_phone_auth/data/model/verify_otp_request.dart';
import 'package:example_app/features/firebase_phone_auth/presentation/bloc/phone_auth_bloc.dart';
import 'package:example_app/features/firebase_phone_auth/presentation/bloc/phone_auth_event.dart';
import 'package:example_app/features/firebase_phone_auth/presentation/bloc/phone_auth_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/const/string_constants.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/localizations/localization_extension.dart';
import '../../../../core/ui/widgets/button.dart';

class VerifyOtpScreen extends BaseBlocWidget {
  final String verificationID;

  final String phoneNo;

  final int? resendOtpToken;

  VerifyOtpScreen({
    required this.verificationID,
    required this.phoneNo,
    this.resendOtpToken,
  });

  @override
  State<VerifyOtpScreen> createState() => _FirebasePhoneAuthScreenState();
}

class _FirebasePhoneAuthScreenState
    extends BaseBlocWidgetState<VerifyOtpScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  int secondsRemaining = 30; // initialize seconds for the resend otp
  late Timer timer;
  String? otpToken;

  String? otp;

  StreamController<int> _remainingSecondController =
      StreamController.broadcast();
  StreamController<bool> _isVerifyEnabledStreamController =
      StreamController.broadcast();
  late String verificationId;

  @override
  void initState() {
    /// initialize verificationID which we get from the phone auth response
    verificationId = widget.verificationID;

    /// Timer for resent otp
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        secondsRemaining--;
        _remainingSecondController.add(secondsRemaining);
      } else {
        _remainingSecondController.add(0);
      }
    });
    super.initState();
  }

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
      body: BlocConsumer<PhoneAuthBloc, PhoneAuthState>(
        listener: (context, state) {
          if (state is VerifyOtpSuccessState) {
            /// Implement actions after otp verification done
            commonUtilities.showToast(
              message:
                  context.tr(LABEL_OTP_VERIFIED),
              backgroundColors: appColors.blackColor,
              textColors: appColors.whiteColor,
            );
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              context.tr(ENTER_OTP)
                  .getTextColor28W600Inter(
                    screenUtil: screenUtil,
                    appColors: appColors,
                  )
                  .paddingOnly(
                    screenUtil,
                    paddingBottom: 30,
                  ),
              otpInputWidget(),
              SizedBox(
                height: screenUtil.setHeight(30),
              ),

              /// below code for show remaining seconds for resend otp
              StreamBuilder<int>(
                  stream: _remainingSecondController.stream,
                  initialData: 30,
                  builder: (context, snapshot) {
                    int second = snapshot.data ?? 30;
                    return Column(
                      children: [
                        SizedBox(
                          height: screenUtil.setHeight(16.0),
                        ),
                        second != 0
                            ? "${context.tr(TIME_REMAINING)} 0:${second.toString().padLeft(2, "0")}"
                                .getTextColor13W500Inter(
                                screenUtil: screenUtil,
                                appColors: appColors,
                              )
                            : "${context.tr(TIME_REMAINING)} 0:00"
                                .getRedColor13W500Inter(
                                screenUtil: screenUtil,
                                appColors: appColors,
                              ),
                        SizedBox(
                          height: screenUtil.setHeight(5.0),
                        ),
                      ],
                    );
                  }),
              SizedBox(
                height: screenUtil.setHeight(30),
              ),

              /// Enable or disable button based on otp length
              StreamBuilder<bool>(
                  stream: _isVerifyEnabledStreamController.stream,
                  initialData: false,
                  builder: (context, snapshot) {
                    bool isEnabled = snapshot.data ?? false;
                    return PrimaryButton(
                      title:
                          context.tr(LABEL_VERIFY),
                      backgroundColor: appColors.primaryColor,
                      buttonTextColor: appColors.whiteColor,
                      selectHandler: isEnabled
                          ? () {
                              BlocProvider.of<PhoneAuthBloc>(context)
                                  .add(VerifyOtpEvent(
                                      request: VerifyOtpRequest(
                                verificationID: widget.verificationID,
                                otp: pinController.text,
                              )));
                            }
                          : null,
                    ).paddingOnly(
                      screenUtil,
                      paddingBottom: 30,
                    );
                  }),
              BlocConsumer<PhoneAuthBloc, PhoneAuthState>(
                listener: (context, state) {
                  if (state is ResendOtpSuccessState) {
                    commonUtilities.showToast(
                      message: context.tr(LABEL_OTP_RESEND),
                      backgroundColors: appColors.blackColor,
                      textColors: appColors.whiteColor,
                    );
                  }
                },
                builder: (context, state) {
                  /// below code for  enable or disable to resend otp button
                  return StreamBuilder<int>(
                      stream: _remainingSecondController.stream,
                      initialData: 30,
                      builder: (context, snapshot) {
                        int second = snapshot.data ?? 30;
                        return RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: context.tr(DID_NOT_RECEIVED_OTP),
                            style: getFormLabelTextStyle(
                              screenUtil: screenUtil,
                              appColors: appColors,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: " "),
                              second == 0
                                  ? TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          pinController.clear();
                                          secondsRemaining = 30;
                                          _remainingSecondController
                                              .add(secondsRemaining);
                                          callResendOtp(
                                            phoneNumber: widget.phoneNo,
                                            resendToken: widget.resendOtpToken,
                                          );
                                        },
                                      text: context.tr(RESEND),
                                      style:
                                          getPrimaryColor15W500underLineTextStyle(
                                        screenUtil: screenUtil,
                                        appColors: appColors,
                                      ),
                                    )
                                  : TextSpan(
                                      text: context.tr(RESEND),
                                      style:
                                          getSubTextColor15W500underLineTextStyle(
                                        screenUtil: screenUtil,
                                        appColors: appColors,
                                      )),
                            ],
                          ),
                        );
                      });
                },
              ),
            ],
          );
        },
      ).paddingAll(
        padding: 20,
        screenUtil: screenUtil,
      ));

  /// pin input widget

  otpInputWidget() {
    var focusedBorderColor = appColors.primaryColor;
    var fillColor = appColors.whiteColor;
    var borderColor = appColors.subtextColor;

    final defaultPinTheme = PinTheme(
      width: screenUtil.setWidth(50),
      height: screenUtil.setWidth(50),
      textStyle: getFormTextStyle(
        screenUtil: screenUtil,
        appColors: appColors,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
        ),
      ),
    );
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: pinController,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        validator: (value) {},
        onCompleted: (pin) {},
        length: 6,
        onChanged: (pin) {
          /// implement logic based on otp length
          if (pin.length == 6) {
            otp = pin;
            _isVerifyEnabledStreamController.add(true);
          } else {
            _isVerifyEnabledStreamController.add(false);
          }
        },
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: focusedBorderColor,
            ),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: fillColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: focusedBorderColor,
            ),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(
            color: appColors.redColor,
          ),
        ),
      ),
    );
  }

  /// call resend otp bloc event
  Future<void> callResendOtp(
      {required String phoneNumber, int? resendToken}) async {
    BlocProvider.of<PhoneAuthBloc>(context).add(FetchResendOtpEvent(
        phoneNumber: phoneNumber, resendOtpToken: resendToken));
  }
}
