import 'package:flutter_clean_architecture/features/create_an_account/data/model/signup_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_state.dart';

@immutable
class CreateAnAccountState extends ApiBaseBlocState {}

class CreateAnAccountStateInitialState extends CreateAnAccountState {}

class SignupState extends CreateAnAccountState {
  final SignupResponseModel response;
  final String message;

  SignupState({required this.response, required this.message});
}

class SignupErrorState extends CreateAnAccountState {
  final String message;
  final int statusCode;

  SignupErrorState({
    required this.message,
    required this.statusCode,
  });
}
