import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_event.dart';
import 'package:flutter_clean_architecture/core/base/bloc/base_bloc.dart';
import 'package:flutter_clean_architecture/features/delete_account/data/model/delete_account_response_model.dart';
import 'package:flutter_clean_architecture/features/delete_account/domain/usecases/delete_account_usecase.dart';

import 'delete_account_event.dart';
import 'delete_account_state.dart';

class DeleteAccountBloc
    extends BaseBloc<DeleteAccountEvent, DeleteAccountState> {
  final DeleteAccountUseCase deleteAccountUseCase;
  DeleteAccountBloc({
    required this.deleteAccountUseCase,
    required ApiBaseBloc apiBaseBloc,
  }) : super(apiBaseBloc, DeleteAccountStateInitialState()) {
    on<DeleteEvent>(deleteAccountEvent);
  }

  Future<void> deleteAccountEvent(DeleteEvent event, Emitter emit) async {
    await mockAPIDelay();
    Either<Failure, Success> result = await deleteAccountUseCase(event.request);
    await result.fold(
      (failure) async {
        apiBaseBlocObject.add(
          ErrorApiEvent(
            failure: failure,
          ),
        );
        emit(
          DeleteAccountErrorState(
            message: failure.errorMessage,
            statusCode: failure.statusCode,
          ),
        );
      },
      (data) async {
        apiBaseBlocObject.add(LoadedApiEvent());
        DeleteAccountResponseModel deleteAccountResponseModel = data.data;
        await addDelayForDialogPopAndScreenNavigation();
        emit(
          DeleteState(
            response: deleteAccountResponseModel,
            message: data.message ?? '',
          ),
        );
      },
    );
  }
}
