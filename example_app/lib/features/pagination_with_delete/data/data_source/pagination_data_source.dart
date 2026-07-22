import 'package:example_app/features/pagination_with_delete/data/model/delete_request_model.dart';
import 'package:example_app/features/pagination_with_delete/data/model/request_model.dart';

import '../../../../core/api/model/api_response.dart';

abstract class PaginationDataSource {
  Future<ApiResponse> getPaginationData(
    PaginationRequestModel paginationRequestModel,
  );

  Future<ApiResponse> deleteItemData(DeleteRequestModel deleteRequestModel);
}
