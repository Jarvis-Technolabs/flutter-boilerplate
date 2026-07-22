import 'package:example_app/features/get_api/data/model/user_list_response.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/base/bloc/api_base_bloc/api_base_bloc_state.dart';

@immutable
class UserState extends ApiBaseBlocState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class GetUserListSuccessState extends UserState {
  final UserListResponse response;

  GetUserListSuccessState({
    required this.response,
  });
}

class GetUserListFailureState extends UserState {
  final String message;

  GetUserListFailureState({
    required this.message,
  });
}
