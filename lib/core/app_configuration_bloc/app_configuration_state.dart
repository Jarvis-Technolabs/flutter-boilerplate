import 'package:flutter/foundation.dart';

import '../../../../core/base/bloc/api_base_bloc/api_base_bloc_state.dart';

@immutable
class AppConfigurationState extends ApiBaseBlocState {}

class AppConfigurationInitial extends AppConfigurationState {}

class AppConfigurationFetchedState extends AppConfigurationState {}