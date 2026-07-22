import 'dart:async';

import 'package:bloc/bloc.dart';

import 'api_base_bloc_event.dart';
import 'api_base_bloc_state.dart';

class ApiBaseBloc extends Bloc<ApiBaseBlocEvents, ApiBaseBlocState> {
  ApiBaseBloc(ApiBaseBlocInitialState apiBaseBlocInitialState)
      : super(apiBaseBlocInitialState) {
    on<LoadApiEvent>(_loadApiEvent);
    on<LoadedApiEvent>(_loadedApiEvent);
    on<ErrorApiEvent>(_errorApiEvent);
  }

  Future<void> _loadApiEvent(
          LoadApiEvent event, Emitter<ApiBaseBlocState> emit) async =>
      emit(ApiLoadingState());

  Future<void> _loadedApiEvent(
          LoadedApiEvent event, Emitter<ApiBaseBlocState> emit) async =>
      emit(ApiLoadedState());

  Future<void> _errorApiEvent(
          ErrorApiEvent event, Emitter<ApiBaseBlocState> emit) async =>
      emit(
        ApiErrorState(
          message: event.failure.errorMessage,
          apiStatusCode: event.failure.statusCode,
        ),
      );
}
