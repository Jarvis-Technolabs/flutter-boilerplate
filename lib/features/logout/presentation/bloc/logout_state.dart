import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_state.dart';
import 'package:flutter_clean_architecture/features/logout/data/model/logout_response_model.dart';

@immutable
class LogoutState extends ApiBaseBlocState {}

class LogoutStateInitialState extends LogoutState {}

class LogoutUserState extends LogoutState {
  final LogoutResponseModel response;
  final String message;

  LogoutUserState({required this.response, required this.message});
}

class LogoutErrorState extends LogoutState {
  final String message;
  final int statusCode;

  LogoutErrorState({
    required this.message,
    required this.statusCode,
  });
}
