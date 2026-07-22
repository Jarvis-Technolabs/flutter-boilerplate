import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/base/bloc/api_base_bloc/api_base_bloc_state.dart';

@immutable
class SocialLoginState extends ApiBaseBlocState {}

class SocialLoginInitialState extends SocialLoginState {}

class GoogleSignInSuccessState extends SocialLoginState {
  final UserCredential userCredential;

  GoogleSignInSuccessState({
    required this.userCredential,
  });
}

class AppleSignInSuccessState extends SocialLoginState {
  final UserCredential userCredential;

  AppleSignInSuccessState({
    required this.userCredential,
  });
}

class SocialLoginFailureState extends SocialLoginState {
  final String message;

  SocialLoginFailureState({
    required this.message,
  });
}
