import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_event.dart';
import 'package:flutter_clean_architecture/core/base/bloc/base_bloc.dart';
import 'package:flutter_clean_architecture/features/logout/data/model/logout_response_model.dart';
import 'package:flutter_clean_architecture/features/logout/domain/usecases/logout_usecase.dart';

import 'logout_event.dart';
import 'logout_state.dart';

class LogoutBloc extends BaseBloc<LogoutEvent, LogoutState> {
  final LogoutUseCase logoutUseCase;
  LogoutBloc({
    required this.logoutUseCase,
    required ApiBaseBloc apiBaseBloc,
  }) : super(apiBaseBloc, LogoutStateInitialState()) {
    on<LogoutUserEvent>(logoutEvent);
  }

  Future<void> logoutEvent(LogoutUserEvent event, Emitter emit) async {
    apiBaseBlocObject.add(LoadApiEvent());
    await mockAPIDelay();
    Either<Failure, Success> result = await logoutUseCase(event.request);
    await result.fold(
      (failure) async {
        apiBaseBlocObject.add(
          ErrorApiEvent(failure: failure),
        );
        emit(
          LogoutErrorState(
            message: failure.errorMessage,
            statusCode: failure.statusCode,
          ),
        );
      },
      (data) async {
        apiBaseBlocObject.add(LoadedApiEvent());
        LogoutResponseModel logoutResponseModel = data.data;
        await addDelayForDialogPopAndScreenNavigation();
        emit(
          LogoutUserState(
            response: logoutResponseModel,
            message: data.message ?? '',
          ),
        );
      },
    );
  }
}
