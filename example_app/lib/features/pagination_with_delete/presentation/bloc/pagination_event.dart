import 'package:example_app/features/pagination_with_delete/data/model/delete_request_model.dart';
import 'package:example_app/features/pagination_with_delete/data/model/request_model.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class PaginationEvent {}

class FetchPaginationDataEvent extends PaginationEvent {
  final PaginationRequestModel paginationRequestModel;
  FetchPaginationDataEvent({required this.paginationRequestModel});
}

class DeleteItemEvent extends PaginationEvent {
  final DeleteRequestModel deleteRequestModel;
  DeleteItemEvent({required this.deleteRequestModel});
}
