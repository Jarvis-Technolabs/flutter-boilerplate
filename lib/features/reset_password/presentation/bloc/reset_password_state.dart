import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_state.dart';
import 'package:flutter_clean_architecture/features/reset_password/data/model/reset_password_response_model.dart';

@immutable
class ResetPasswordState extends ApiBaseBlocState {}

class ResetPasswordStateInitialState extends ResetPasswordState {}

class ResetPasswordSuccessState extends ResetPasswordState {
  final ResetPasswordResponseModel response;
  final String message;

  ResetPasswordSuccessState({required this.response, required this.message});
}

class ResetPasswordErrorState extends ResetPasswordState {
  final String message;
  final int statusCode;

  ResetPasswordErrorState({
    required this.message,
    required this.statusCode,
  });
}
