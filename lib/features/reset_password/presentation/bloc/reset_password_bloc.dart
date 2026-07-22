import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_event.dart';
import 'package:flutter_clean_architecture/core/base/bloc/base_bloc.dart';
import 'package:flutter_clean_architecture/features/reset_password/data/model/reset_password_response_model.dart';
import 'package:flutter_clean_architecture/features/reset_password/domain/usecases/reset_password_usecase.dart';

import 'reset_password_event.dart';
import 'reset_password_state.dart';

class ResetPasswordBloc
    extends BaseBloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;
  ResetPasswordBloc({
    required this.resetPasswordUseCase,
    required ApiBaseBloc apiBaseBloc,
  }) : super(apiBaseBloc, ResetPasswordStateInitialState()) {
    on<ResetPassword>(resetPasswordEvent);
  }

  Future<void> resetPasswordEvent(ResetPassword event, Emitter emit) async {
    apiBaseBlocObject.add(LoadApiEvent());
    await mockAPIDelay();
    Either<Failure, Success> result = await resetPasswordUseCase(event.request);
    await result.fold(
      (failure) async {
        apiBaseBlocObject.add(ErrorApiEvent(failure: failure));
        emit(
          ResetPasswordErrorState(
            message: failure.errorMessage,
            statusCode: failure.statusCode,
          ),
        );
      },
      (data) async {
        apiBaseBlocObject.add(LoadedApiEvent());
        ResetPasswordResponseModel resetPasswordResponseModel = data.data;
        await addDelayForDialogPopAndScreenNavigation();
        emit(
          ResetPasswordSuccessState(
            response: resetPasswordResponseModel,
            message: data.message ?? '',
          ),
        );
      },
    );
  }
}
