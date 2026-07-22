import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_state.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_response_model.dart';

@immutable
class ForgotPasswordState extends ApiBaseBlocState {}

class ForgotPasswordStateInitialState extends ForgotPasswordState {}

class ForgotPassword extends ForgotPasswordState {
  final ForgotPasswordResponseModel response;
  final String message;

  ForgotPassword({required this.response, required this.message});
}

class ForgotpasswordErrorState extends ForgotPasswordState {
  final String message;
  final int statusCode;

  ForgotpasswordErrorState({
    required this.message,
    required this.statusCode,
  });
}
