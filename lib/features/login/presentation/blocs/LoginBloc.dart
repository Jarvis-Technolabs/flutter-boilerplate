import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/login/domain/repository/UserRepository.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({
    @required this.userRepository,
  }) : assert(userRepository != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        yield LoginInitial();
        final output = await userRepository.login(event.registrationRequest);

        yield* output.fold((failure) async* {
          yield LoginFailure(error: "Login Error!!");
        }, (feedItems) async* {
          yield LoginSuccess();
        });
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
