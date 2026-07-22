import 'package:flutter_clean_architecture/features/delete_account/data/model/delete_account_request_model.dart';
import 'package:flutter_clean_architecture/core/const/api_constants.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds.dart';
import 'delete_account_data_source.dart';

class DeleteAccountDataSourceImpl extends DeleteAccountDataSource {
  final IRemoteDataSource remoteDataSource;

  DeleteAccountDataSourceImpl({
    required this.remoteDataSource,
  });
  @override
  Future<ApiResponse> callDeleteAccount(
          DeleteAccountRequestModel deleteAccountRequestModel) =>
      remoteDataSource.executePost(
        path: DELETE_ACCOUNT_API,
        requestBody: deleteAccountRequestModel.toJson(),
      );
}
