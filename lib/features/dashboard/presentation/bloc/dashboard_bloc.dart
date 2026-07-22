import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/base_bloc.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends BaseBloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required ApiBaseBloc apiBaseBloc,
  }) : super(apiBaseBloc, DashboardStateInitialState()) {}
}
