import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_state.dart';
import 'package:flutter_clean_architecture/features/login/data/model/login_response_model.dart';

@immutable
class LoginState extends ApiBaseBlocState {}

class LoginStateInitialState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginResponseModel response;
  final String message;

  LoginSuccessState({required this.response, required this.message});
}

class LoginErrorState extends LoginState {
  final String message;
  final int statusCode;

  LoginErrorState({
    required this.message,
    required this.statusCode,
  });
}

class GeneratePublicTokenErrorState extends LoginState {
  final String message;

  GeneratePublicTokenErrorState({
    required this.message,
  });
}
