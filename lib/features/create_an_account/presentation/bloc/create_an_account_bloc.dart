import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_event.dart';
import 'package:flutter_clean_architecture/core/base/bloc/base_bloc.dart';
import 'package:flutter_clean_architecture/features/create_an_account/data/model/signup_response_model.dart';
import 'package:flutter_clean_architecture/features/create_an_account/domain/usecases/signup_usecase.dart';

import 'create_an_account_event.dart';
import 'create_an_account_state.dart';

class CreateAnAccountBloc
    extends BaseBloc<CreateAnAccountEvent, CreateAnAccountState> {
  final SignupUseCase signupUseCase;
  CreateAnAccountBloc({
    required this.signupUseCase,
    required ApiBaseBloc apiBaseBloc,
  }) : super(apiBaseBloc, CreateAnAccountStateInitialState()) {
    on<SignupEvent>(signupEvent);
  }

  Future<void> signupEvent(SignupEvent event, Emitter emit) async {
    apiBaseBlocObject.add(LoadApiEvent());
    await mockAPIDelay();
    Either<Failure, Success> result = await signupUseCase(event.request);
    await result.fold(
      (failure) async {
        apiBaseBlocObject.add(ErrorApiEvent(failure: failure));
        emit(
          SignupErrorState(
            message: failure.errorMessage,
            statusCode: failure.statusCode,
          ),
        );
      },
      (data) async {
        apiBaseBlocObject.add(LoadedApiEvent());
        SignupResponseModel signupResponseModel = data.data;
        await addDelayForDialogPopAndScreenNavigation();
        emit(
          SignupState(
            response: signupResponseModel,
            message: data.message ?? '',
          ),
        );
      },
    );
  }
}
