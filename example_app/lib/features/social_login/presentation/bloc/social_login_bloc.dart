import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:example_app/core/api/model/no_request.dart';
import 'package:example_app/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:example_app/core/base/bloc/base_bloc.dart';
import 'package:example_app/features/social_login/presentation/bloc/social_login_event.dart';
import 'package:example_app/features/social_login/presentation/bloc/social_login_state.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';
import '../../../../core/base/bloc/api_base_bloc/api_base_bloc_event.dart';
import '../../domain/usecases/apple_sign_in_usecase.dart';
import '../../domain/usecases/google_sign_in_usecase.dart';

class SocialLoginBloc extends BaseBloc<SocialLoginEvent, SocialLoginState> {
  final GoogleSignInUseCase googleSignInUseCase;
  final AppleSignInUseCase appleSignInUseCase;

  SocialLoginBloc({
    required ApiBaseBloc apiBaseBloc,
    required this.googleSignInUseCase,
    required this.appleSignInUseCase,
  }) : super(apiBaseBloc, SocialLoginInitialState()) {
    on<CallGoogleSignInEvent>(callSignInWithGoogle);
    on<CallAppleSignInEvent>(callSignInWithApple);
  }

  /// CallGoogleSignInEvent event handler
  Future<void> callSignInWithGoogle(
      CallGoogleSignInEvent event, Emitter<SocialLoginState> emit) async {
    apiBaseBlocObject.add(LoadApiEvent());
    Either<Failure, Success> result = await googleSignInUseCase(NoRequest());

    await result.fold(
      (failure) {
        apiBaseBlocObject.add(ErrorApiEvent(failure: failure));
      },
      (success) {
        apiBaseBlocObject.add(LoadedApiEvent());
        emit(GoogleSignInSuccessState(userCredential: success.data));
      },
    );
  }

  /// CallAppleSignInEvent handler
  Future<void> callSignInWithApple(
      CallAppleSignInEvent event, Emitter<SocialLoginState> emit) async {
    apiBaseBlocObject.add(LoadApiEvent());
    Either<Failure, Success> result = await appleSignInUseCase(NoRequest());

    await result.fold(
      (failure) {
        apiBaseBlocObject.add(ErrorApiEvent(failure: failure));
      },
      (success) {
        apiBaseBlocObject.add(LoadedApiEvent());
        emit(AppleSignInSuccessState(userCredential: success.data));
      },
    );
  }
}
