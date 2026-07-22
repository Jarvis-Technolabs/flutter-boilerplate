import 'package:example_app/features/firebase_phone_auth/data/model/phone_auth_response.dart';
import 'package:flutter/foundation.dart';

import '../../data/model/verify_otp_request.dart';

@immutable
abstract class PhoneAuthEvent {}

class FetchPhoneAuthOtpEvent extends PhoneAuthEvent {
  final String phoneNumber;

  FetchPhoneAuthOtpEvent({required this.phoneNumber});
}

class GotoOTPScreenEvent extends PhoneAuthEvent {
  final PhoneAuthResponse response;

  GotoOTPScreenEvent({required this.response});
}

class VerifyOtpEvent extends PhoneAuthEvent {
  final VerifyOtpRequest request;

  VerifyOtpEvent({required this.request});
}

class FetchResendOtpEvent extends PhoneAuthEvent {
  final String phoneNumber;
  final int? resendOtpToken;

  FetchResendOtpEvent({required this.phoneNumber, this.resendOtpToken});
}

class ResendOTPScreenEvent extends PhoneAuthEvent {
  final PhoneAuthResponse response;

  ResendOTPScreenEvent({required this.response});
}
