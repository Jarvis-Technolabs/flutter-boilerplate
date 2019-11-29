import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/core/models/base_bloc/base_state.dart';

class LoginState extends BaseApiState {
  LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
