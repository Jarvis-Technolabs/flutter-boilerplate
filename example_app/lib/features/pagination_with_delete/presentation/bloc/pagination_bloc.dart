import 'dart:async';
import 'dart:io';

import 'package:bloc/src/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:example_app/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:example_app/core/base/bloc/api_base_bloc/api_base_bloc_event.dart';
import 'package:example_app/core/base/bloc/base_bloc.dart';
import 'package:example_app/core/const/api_constants.dart';
import 'package:example_app/core/di/injection_container.dart';
import 'package:example_app/core/preference/preference_helper.dart';
import 'package:example_app/features/pagination_with_delete/domain/usecases/delete_item_data_usecase.dart';
import 'package:example_app/features/pagination_with_delete/domain/usecases/pagination_data_usecase.dart';
import 'package:example_app/features/pagination_with_delete/presentation/bloc/pagination_event.dart';
import 'package:example_app/features/pagination_with_delete/presentation/bloc/pagination_state.dart';
import 'package:example_app/features/splash/data/model/get_mobile_config_response.dart';
import 'package:example_app/features/splash/domain/usecases/generate_public_token_usecase.dart';
import 'package:example_app/features/splash/domain/usecases/get_mobile_config_usecase.dart';
import 'package:example_app/features/splash/presentation/bloc/splash_event.dart';
import 'package:example_app/features/splash/presentation/bloc/splash_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/no_request.dart';
import '../../../../core/api/model/success.dart';

class PaginationBloc extends BaseBloc<PaginationEvent, PaginationState> {
  final PaginationDataUseCase paginationDataUseCase;
  final DeleteItemDataUseCase deleteItemDataUseCase;
  final PreferenceHelper preferenceHelper = sl();

  PaginationBloc({
    required ApiBaseBloc apiBaseBloc,
    required this.paginationDataUseCase,
    required this.deleteItemDataUseCase,
  }) : super(apiBaseBloc, PaginationInitialState()) {
    on<DeleteItemEvent>(_deleteItemDataEvent);
    on<FetchPaginationDataEvent>(_FetchPaginationDataEvent);
  }

  Future<void> _deleteItemDataEvent(
      DeleteItemEvent event, Emitter<PaginationState> emit) async {
    emit(PaginationLoadingState());
    Either<Failure, Success> result =
        await deleteItemDataUseCase(event.deleteRequestModel);
    await result.fold(
      (failure) {
        emit(DeleteItemDataErrorState(message: failure.errorMessage));
      },
      (data) {
        emit(DeleteItemDataState(message: data.data));
      },
    );
  }

  Future<void> _FetchPaginationDataEvent(
      FetchPaginationDataEvent event, Emitter<PaginationState> emit) async {
    emit(PaginationLoadingState());
    Either<Failure, Success> result =
        await paginationDataUseCase(event.paginationRequestModel);

    await result.fold((failure) async {
      emit(PaginationErrorState(message: failure.errorMessage));
    }, (data) {
      emit(PaginationDataFetchedState(paginationResponse: data.data));
    });
  }
}
