import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/no_request.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_event.dart';
import 'package:flutter_clean_architecture/core/base/bloc/base_bloc.dart';
import 'package:flutter_clean_architecture/core/const/api_constants.dart';
import 'package:flutter_clean_architecture/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_clean_architecture/features/splash/domain/usecases/generate_public_token_usecase.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final GeneratePublicTokenUseCase generatePublicTokenUseCase;

  LoginBloc({
    required this.loginUseCase,
    required this.generatePublicTokenUseCase,
    required ApiBaseBloc apiBaseBloc,
  }) : super(apiBaseBloc, LoginStateInitialState()) {
    on<LoginRequestEvent>(loginEvent);
    on<PublicTokenEvent>(publicTokenEvent);
  }

  Future<void> publicTokenEvent(PublicTokenEvent event, Emitter emit) async {
    Either<Failure, Success> result =
        await generatePublicTokenUseCase(NoRequest());
    await result.fold(
      (failure) {
        emit(GeneratePublicTokenErrorState(message: failure.errorMessage));
      },
      (data) {
        add(LoginRequestEvent(request: event.request));
      },
    );
  }

  Future<void> loginEvent(LoginRequestEvent event, Emitter emit) async {
    apiBaseBlocObject.add(LoadApiEvent());
    await mockAPIDelay();
    Either<Failure, Success> result = await loginUseCase(event.request);
    await result.fold(
      (failure) async {
        if (failure.statusCode == UN_AUTHORISED_ERROR_CODE) {
          add(PublicTokenEvent(request: event.request));
        } else {
          apiBaseBlocObject.add(ErrorApiEvent(failure: failure));
          emit(
            LoginErrorState(
              message: failure.errorMessage,
              statusCode: failure.statusCode,
            ),
          );
        }
      },
      (data) async {
        apiBaseBlocObject.add(LoadedApiEvent());
        await addDelayForDialogPopAndScreenNavigation();
        emit(
          LoginSuccessState(
            response: data.data,
            message: data.message ?? '',
          ),
        );
      },
    );
  }
}
