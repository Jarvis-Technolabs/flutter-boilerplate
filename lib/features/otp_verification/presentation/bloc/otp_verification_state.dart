import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_state.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/sendOTP_response_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/verifyOTP_response_model.dart';

@immutable
class OtpVerificationState extends ApiBaseBlocState {}

class OtpVerificationStateInitialState extends OtpVerificationState {}

class SendOtpState extends OtpVerificationState {
  final SendOTPResponseModel sendOTPResponseModel;
  final String message;
  final bool isResendOtp;

  SendOtpState({
    required this.sendOTPResponseModel,
    required this.message,
    required this.isResendOtp,
  });
}

class SendOtpErrorState extends OtpVerificationState {
  final String message;
  final int statusCode;

  SendOtpErrorState({
    required this.message,
    required this.statusCode,
  });
}

class VerifyOtpState extends OtpVerificationState {
  final VerifyOTPResponseModel response;
  final String message;

  VerifyOtpState({
    required this.response,
    required this.message,
  });
}

class VerifyOtpErrorState extends OtpVerificationState {
  final String message;
  final int statusCode;

  VerifyOtpErrorState({
    required this.message,
    required this.statusCode,
  });
}
