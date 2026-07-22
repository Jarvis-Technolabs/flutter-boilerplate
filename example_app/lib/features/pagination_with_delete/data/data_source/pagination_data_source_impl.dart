import 'package:example_app/features/pagination_with_delete/data/model/delete_request_model.dart';
import 'package:example_app/features/pagination_with_delete/data/model/request_model.dart';

import '../../../../core/api/data_source/remote_ds/remote_ds.dart';
import '../../../../core/api/model/api_response.dart';
import '../../../../core/const/api_constants.dart';
import 'pagination_data_source.dart';

class PaginationDataSourceImpl extends PaginationDataSource {
  late final IRemoteDataSource remoteDataSource;

  PaginationDataSourceImpl({
    required this.remoteDataSource,
  });

  @override
  Future<ApiResponse> getPaginationData(
          PaginationRequestModel paginationRequestModel) =>
      remoteDataSource.executePost(
        path: PAGINATION_API,
        requestBody: paginationRequestModel.toJson(),
      );

  @override
  Future<ApiResponse> deleteItemData(DeleteRequestModel deleteRequestModel) =>
      remoteDataSource.executePost(
        path: DELETE_ITEM_API,
        requestBody: deleteRequestModel.toJson(),
      );
}
