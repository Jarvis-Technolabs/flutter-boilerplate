import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/base/bloc/api_base_bloc/api_base_bloc_state.dart';
import '../../data/model/phone_auth_response.dart';

@immutable
class PhoneAuthState extends ApiBaseBlocState {}

class PhoneAuthInitialState extends PhoneAuthState {}

class PhoneAuthSuccessState extends PhoneAuthState {
  final PhoneAuthResponse response;

  PhoneAuthSuccessState({
    required this.response,
  });
}

class PhoneAuthFailureState extends PhoneAuthState {
  final String message;

  PhoneAuthFailureState({
    required this.message,
  });
}

class VerifyOtpSuccessState extends PhoneAuthState {
  final UserCredential userCredential;

  VerifyOtpSuccessState({
    required this.userCredential,
  });
}

class VerifyOtpFailureState extends PhoneAuthState {
  final String message;

  VerifyOtpFailureState({
    required this.message,
  });
}

class ResendOtpSuccessState extends PhoneAuthState {
  final PhoneAuthResponse response;

  ResendOtpSuccessState({
    required this.response,
  });
}

class ResendOtpFailureState extends PhoneAuthState {
  final String message;

  ResendOtpFailureState({
    required this.message,
  });
}
