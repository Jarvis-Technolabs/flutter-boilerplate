import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/base_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc({
    required ApiBaseBloc apiBaseBloc,
  }) : super(apiBaseBloc, HomeStateInitialState()) {}
}
