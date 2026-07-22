import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_bloc_widget.dart';
import 'package:flutter_clean_architecture/core/const/app_constants.dart';
import 'package:flutter_clean_architecture/core/const/string_constants.dart';
import 'package:flutter_clean_architecture/core/enums/otp_screen_type.dart';
import 'package:flutter_clean_architecture/core/enums/otp_verification_for.dart';
import 'package:flutter_clean_architecture/core/localizations/app_localizations.dart';
import 'package:flutter_clean_architecture/core/routes/routes.dart';
import 'package:flutter_clean_architecture/core/ui/theme/text_extension/text_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/button.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/common_app_bar.dart';
import 'package:flutter_clean_architecture/features/dashboard/dashboard_page.dart';
import 'package:flutter_clean_architecture/features/delete_account/data/model/delete_account_request_model.dart';
import 'package:flutter_clean_architecture/features/delete_account/presentation/bloc/delete_account_bloc.dart';
import 'package:flutter_clean_architecture/features/delete_account/presentation/bloc/delete_account_event.dart';
import 'package:flutter_clean_architecture/features/delete_account/presentation/bloc/delete_account_state.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_response_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/sendOTP_request_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/verifyOTP_request_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/presentation/bloc/otp_verification_bloc.dart';
import 'package:flutter_clean_architecture/features/otp_verification/presentation/bloc/otp_verification_event.dart';
import 'package:flutter_clean_architecture/features/otp_verification/presentation/bloc/otp_verification_state.dart';
import 'package:flutter_clean_architecture/features/reset_password/reset_password_page.dart';
import 'package:flutter_clean_architecture/features/splash/presentation/splash_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/localizations/localization_extension.dart';

class OtpVerificationScreen extends BaseBlocWidget {
  final SendOtpTo sendOtpTo;
  final SendOtpFor sendOtpFor;
  final String mobileNumber, email;
  final ForgotPasswordResponseModel? forgotPasswordResponseModel;

  OtpVerificationScreen({
    Key? key,
    required this.sendOtpTo,
    required this.mobileNumber,
    required this.email,
    required this.sendOtpFor,
    this.forgotPasswordResponseModel,
  }) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState
    extends BaseBlocWidgetState<OtpVerificationScreen> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode pinFocusNode = FocusNode();
  late final PinInputController otpPinController;
  String time = "";
  final int noOfBoxes = 4;
  Timer? _timer;
  int _start = TIMER_COUNT_DOWN;
  int minutes = 00, seconds = 00;
  final StreamController<int> timerStreamController =
      StreamController<int>.broadcast();
  final StreamController<bool> resendOtpStreamController =
      StreamController<bool>.broadcast();
  String? otpToken;
  bool isResendOtpAllowed = true;

  @override
  void initState() {
    otpPinController = PinInputController(
      textController: pinController,
      focusNode: pinFocusNode,
    );
    sendOTP();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    timerStreamController.close();
    otpPinController.dispose();
    pinController.dispose();
    pinFocusNode.dispose();
    super.dispose();
  }

  void startCountDownTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _start = TIMER_COUNT_DOWN;
    }
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
        } else {
          _start--;
        }
        timerStreamController.add(_start);
      },
    );
  }

  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: CommonAppBar(
          title: widget.sendOtpTo == SendOtpTo.Mobile
              ? LABEL_VERIFY_MOBILE
              : LABEL_VERIFY_EMAIL,
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<OtpVerificationBloc, OtpVerificationState>(
              listener: (_, state) async {
                if (state is SendOtpState) {
                  otpToken = state.sendOTPResponseModel.otpToken;
                  isResendOtpAllowed =
                      state.sendOTPResponseModel.isResendOtpAllowed ?? false;
                  pinFocusNode.requestFocus();
                  startCountDownTimer();
                  if (state.isResendOtp) {
                    commonUtilities.showToast(
                      message: context.tr(RESEND_OTP_SUCCESSFULLY),
                      textColors: appColors.whiteColor,
                      backgroundColors: appColors.blackColor,
                    );
                    time = "";
                    pinController.text = '';
                    resendOtpStreamController.add(true);
                  }
                } else if (state is VerifyOtpState) {
                  if (widget.sendOtpFor == SendOtpFor.REGISTER) {
                    navigateAndRemoveAll(
                      context: context,
                      routeName: Routes.dashboard,
                      route: DashboardPage(),
                    );
                  } else if (widget.sendOtpFor == SendOtpFor.FORGOT_PASSWORD) {
                    navigatePush(
                      context,
                      ResetPasswordPage(
                        forgotPasswordResponseModel:
                            widget.forgotPasswordResponseModel,
                      ),
                    );
                  } else if (widget.sendOtpFor == SendOtpFor.DELETE_ACCOUNT) {
                    deleteAccountAPI();
                  }
                }
              },
            ),
            BlocListener<DeleteAccountBloc, DeleteAccountState>(
              listener: (BuildContext context, DeleteAccountState state) async {
                if (state is DeleteState) {
                  navigateAndRemoveAll(
                    context: context,
                    routeName: Routes.splash,
                    route: SplashPage(),
                  );
                }
              },
            ),
          ],
          child: otpBodyWidget(),
        ),
      );

  Widget otpBodyWidget() => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.verticalSpace,
            RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: context.tr(LABEL_RECEIVE_OTP_ON),
                    style: getText16W600TextStyle(
                      screenUtil: screenUtil,
                      appColors: appColors,
                    ),
                  ),
                  TextSpan(
                    text: ((widget.sendOtpTo == SendOtpTo.Mobile)
                        ? widget.mobileNumber
                        : widget.email),
                    style: getText16W600TextStyle(
                      screenUtil: screenUtil,
                      appColors: appColors,
                    ),
                  ),
                ],
              ),
            ),
            24.verticalSpace,
            MaterialPinField(
              pinController: otpPinController,
              enableAutofill: true,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              length: noOfBoxes,
              obscureText: false,
              blinkWhenObscuring: true,
              theme: MaterialPinTheme(
                shape: MaterialPinShape.outlined,
                textStyle: getOTPTextStyle(
                  appColors,
                  screenUtil,
                ),
                borderRadius: BorderRadius.circular(
                  screenUtil.setHeight(20.0),
                ),
                borderWidth: 1,
                errorBorderColor: appColors.blackColor,
                focusedBorderColor: appColors.primaryColor,
                cellSize: Size(
                  screenUtil.setHeight(70.0),
                  screenUtil.setHeight(70.0),
                ),
                borderColor: appColors.subtextColor,
                focusedFillColor: appColors.whiteColor,
                fillColor: appColors.whiteColor,
                followingFillColor: appColors.whiteColor,
                followingBorderColor: appColors.subtextColor,
                filledFillColor: appColors.whiteColor,
                filledBorderColor: appColors.subtextColor,
                cursorColor: appColors.transparentColor,
                showCursor: false,
                entryAnimation: MaterialPinAnimation.fade,
                animationDuration: const Duration(
                  milliseconds: 300,
                ),
              ),
              keyboardType: TextInputType.number,
              onCompleted: (value) {
                checkAndCallVerification();
              },
            ),
            24.verticalSpace,
            PrimaryButton(
              title: context.tr(LABEL_VERIFY),
              backgroundColor: appColors.primaryColor,
              buttonTextColor: appColors.whiteColor,
              selectHandler: checkAndCallVerification,
              borderColor: appColors.primaryColor,
            ),
            24.verticalSpace,
            StreamBuilder<bool>(
              stream: resendOtpStreamController.stream,
              builder: (_, snapshot) => isResendOtpAllowed
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (time == ZERO_SECONDS) ...[
                          GestureDetector(
                            onTap: resendOTP,
                            child: context.tr(LABEL_RESEND_OTP)
                                .getPrimaryText14W400Text(
                                  screenUtil: screenUtil,
                                  appColors: appColors,
                                )
                                .paddingOnly(
                                  screenUtil,
                                  paddingBottom: 1,
                                ),
                          ),
                        ] else ...[
                          context.tr(LABEL_RESEND_OTP_IN)
                              .getText14W400Text(
                                screenUtil: screenUtil,
                                appColors: appColors,
                              )
                              .paddingOnly(
                                screenUtil,
                                paddingBottom: 1,
                              ),
                          getTimerWidget().paddingOnly(
                            screenUtil,
                            paddingLeft: 5,
                          ),
                        ],
                      ],
                    )
                  : SizedBox.shrink(),
            ),
          ],
        ).paddingSymmetric(
          screenUtil: screenUtil,
          horizontalPadding: 24.0,
        ),
      );

  void checkAndCallVerification() {
    if (pinController.text.length == noOfBoxes) {
      FocusScope.of(context).requestFocus(FocusNode());
      verifyOTP();
    } else if (pinController.text.length == 0) {
      commonUtilities.showToast(
        message: context.tr(ERROR_EMPTY_OTP),
        textColors: appColors.whiteColor,
        backgroundColors: appColors.blackColor,
      );
    } else {
      commonUtilities.showToast(
        message:context.tr(ERROR_ENTER_VALID_OTP),
        textColors: appColors.whiteColor,
        backgroundColors: appColors.blackColor,
      );
    }
  }

  Widget getTimerWidget() => StreamBuilder<int>(
        initialData: _start,
        stream: timerStreamController.stream,
        builder: (context, snapshot) {
          resendOtpStreamController.add(true);
          minutes = _start ~/ 60;
          seconds = (_start % 60).toInt();
          time =
              '${NumberFormat("00").format(minutes)}:${NumberFormat("00").format(seconds)}';
          return time.getPrimary14W600Text(
            screenUtil: screenUtil,
            appColors: appColors,
          );
        },
      );

  void resendOTP() {
    BlocProvider.of<OtpVerificationBloc>(context).add(
      SendOtpEvent(
        request: SendOTPRequestModel(
          mobileNo: widget.mobileNumber.trim(),
          email: widget.email.trim(),
          sendOtpTo: widget.sendOtpTo.getSendOtpToValue,
          sendOtpFor: widget.sendOtpFor.getSendOtpForValue,
          isResendOtp: true,
        ),
      ),
    );
  }

  void sendOTP() {
    BlocProvider.of<OtpVerificationBloc>(context).add(
      SendOtpEvent(
        request: SendOTPRequestModel(
          mobileNo: widget.mobileNumber.trim(),
          email: widget.email.trim(),
          sendOtpTo: widget.sendOtpTo.getSendOtpToValue,
          sendOtpFor: widget.sendOtpFor.getSendOtpForValue,
        ),
      ),
    );
  }

  void verifyOTP() {
    BlocProvider.of<OtpVerificationBloc>(context).add(
      VerifyOtpEvent(
        request: VerifyOTPRequestModel(
          otp: pinController.text.trim(),
          token: otpToken,
        ),
        shouldContinueLoading:
            widget.sendOtpFor == SendOtpFor.DELETE_ACCOUNT ? true : false,
      ),
    );
  }

  void deleteAccountAPI() {
    BlocProvider.of<DeleteAccountBloc>(context).add(
      DeleteEvent(
        request: DeleteAccountRequestModel(
          userId: 0,
        ),
      ),
    );
  }
}
