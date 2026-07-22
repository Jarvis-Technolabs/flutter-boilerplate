import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/base_bloc.dart';
import 'setting_event.dart';
import 'setting_state.dart';

class SettingBloc extends BaseBloc<SettingEvent, SettingState> {
  SettingBloc({
    required ApiBaseBloc apiBaseBloc,
  }) : super(apiBaseBloc, SettingStateInitialState()) {}
}
