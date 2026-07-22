import 'package:example_app/features/pagination_with_delete/data/model/pagination_response.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/base/bloc/api_base_bloc/api_base_bloc_state.dart';

@immutable
class PaginationState extends ApiBaseBlocState {}

class PaginationInitialState extends PaginationState {}

class PaginationLoadingState extends PaginationState {}

class PaginationDataFetchedState extends PaginationState {
  PaginationResponse paginationResponse;

  PaginationDataFetchedState({required this.paginationResponse});
}

class PaginationErrorState extends PaginationState {
  final String message;

  PaginationErrorState({
    required this.message,
  });
}

class DeleteItemDataErrorState extends PaginationState {
  final String message;

  DeleteItemDataErrorState({
    required this.message,
  });
}

class DeleteItemDataState extends PaginationState {
  final String message;

  DeleteItemDataState({
    required this.message,
  });
}
