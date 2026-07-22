import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:example_app/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:example_app/core/base/bloc/base_bloc.dart';
import 'package:example_app/features/get_api/domain/usecases/get_api_usecase.dart';
import 'package:example_app/features/get_api/presentation/bloc/user_event.dart';
import 'package:example_app/features/get_api/presentation/bloc/user_state.dart';

import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';

class UserBloc extends BaseBloc<UserEvent, UserState> {
  final UserApiUseCase userApiUseCase;

  UserBloc({
    required ApiBaseBloc apiBaseBloc,
    required this.userApiUseCase,
  }) : super(apiBaseBloc, UserInitialState()) {
    on<FetchUserListEvent>(getUserEvent);
  }

  Future<void> getUserEvent(
      FetchUserListEvent event, Emitter<UserState> emit) async {
    await mockAPIDelay();
    Either<Failure, Success> result = await userApiUseCase(event.request);

    await result.fold(
      (failure) {
        emit(GetUserListFailureState(message: failure.errorMessage));
      },
      (success) {
        emit(GetUserListSuccessState(response: success.data));
      },
    );
  }
}
