import 'package:example_app/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:example_app/core/base/bloc/base_bloc.dart';
import 'accessibility_event.dart';
import 'accessibility_state.dart';

class AccessibilityBloc
    extends BaseBloc<AccessibilityEvent, AccessibilityState> {
  AccessibilityBloc({
    required ApiBaseBloc apiBaseBloc,
  }) : super(apiBaseBloc, AccessibilityStateInitialState()) {}
}
