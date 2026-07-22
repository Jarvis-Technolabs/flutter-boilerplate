import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_event.dart';
import 'package:flutter_clean_architecture/core/base/bloc/base_bloc.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_response_model.dart';
import 'package:flutter_clean_architecture/features/forgot_password/domain/usecases/forgotpassword_usecase.dart';

import 'forgot_password_event.dart';
import 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends BaseBloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;
  ForgotPasswordBloc({
    required this.forgotPasswordUseCase,
    required ApiBaseBloc apiBaseBloc,
  }) : super(apiBaseBloc, ForgotPasswordStateInitialState()) {
    on<ForgotpasswordEvent>(forgotPasswordEvent);
  }

  Future<void> forgotPasswordEvent(
      ForgotpasswordEvent event, Emitter emit) async {
    apiBaseBlocObject.add(LoadApiEvent());
    await mockAPIDelay();
    Either<Failure, Success> result =
        await forgotPasswordUseCase(event.request);
    await result.fold(
      (failure) async {
        apiBaseBlocObject.add(ErrorApiEvent(failure: failure));
        emit(
          ForgotpasswordErrorState(
            message: failure.errorMessage,
            statusCode: failure.statusCode,
          ),
        );
      },
      (data) async {
        apiBaseBlocObject.add(LoadedApiEvent());
        ForgotPasswordResponseModel forgotPasswordResponseModel = data.data;
        await addDelayForDialogPopAndScreenNavigation();
        emit(
          ForgotPassword(
            response: forgotPasswordResponseModel,
            message: data.message ?? '',
          ),
        );
      },
    );
  }
}
