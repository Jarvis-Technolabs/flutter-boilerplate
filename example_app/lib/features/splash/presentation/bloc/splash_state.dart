import 'package:flutter/foundation.dart';

import '../../../../core/base/bloc/api_base_bloc/api_base_bloc_state.dart';

@immutable
class SplashState extends ApiBaseBlocState {}

class SplashInitialEvent extends SplashState {}

class GetMobileConfigFetchedState extends SplashState {
  final int statusCode;
  final bool isAllowed;
  final String? errorMessage;

  GetMobileConfigFetchedState({
    this.isAllowed = true,
    this.statusCode = 1,
    this.errorMessage,
  });
}

class GeneratePublicTokenErrorState extends SplashState {
  final String message;

  GeneratePublicTokenErrorState({
    required this.message,
  });
}
