import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architecture/core/models/base_bloc/base_state.dart';
import 'package:flutter_clean_architecture/core/models/error/failure.dart';
import 'package:flutter_clean_architecture/core/models/error/no_params.dart';

class AuthenticationBloc extends Bloc<NoParams, BaseApiState> {
  Failure objectModel;

  @override
  Stream<BaseApiState> mapEventToState(NoParams event) async* {
    print("Bloc Test::  " +
        "   AuthenticationBloc mapEventToState" +
        state.toString());

    ApiErrorState modelToPass =
        ApiErrorState(objectModel.message, objectModel.apiStatus);
    yield modelToPass;
  }

  @override
  BaseApiState get initialState => BaseApiStateInitial();
}
