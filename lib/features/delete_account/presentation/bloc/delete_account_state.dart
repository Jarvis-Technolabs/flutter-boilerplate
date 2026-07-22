import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_state.dart';
import 'package:flutter_clean_architecture/features/delete_account/data/model/delete_account_response_model.dart';

@immutable
class DeleteAccountState extends ApiBaseBlocState {}

class DeleteAccountStateInitialState extends DeleteAccountState {}

class DeleteState extends DeleteAccountState {
  final DeleteAccountResponseModel response;
  final String message;

  DeleteState({required this.response, required this.message});
}

class DeleteAccountErrorState extends DeleteAccountState {
  final String message;
  final int statusCode;

  DeleteAccountErrorState({
    required this.message,
    required this.statusCode,
  });
}
