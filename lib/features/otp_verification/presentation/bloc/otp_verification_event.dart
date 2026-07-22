import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/sendOTP_request_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/verifyOTP_request_model.dart';

@immutable
abstract class OtpVerificationEvent {}

class SendOtpEvent extends OtpVerificationEvent {
  final SendOTPRequestModel request;
  SendOtpEvent({
    required this.request,
  });
}

class VerifyOtpEvent extends OtpVerificationEvent {
  final VerifyOTPRequestModel request;
  final shouldContinueLoading;
  VerifyOtpEvent({
    required this.request,
    this.shouldContinueLoading = false,
  });
}
