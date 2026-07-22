import 'package:flutter_clean_architecture/features/logout/data/model/logout_request_model.dart';
import 'package:flutter_clean_architecture/core/const/api_constants.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds.dart';
import 'logout_data_source.dart';

class LogoutDataSourceImpl extends LogoutDataSource {
  final IRemoteDataSource remoteDataSource;

  LogoutDataSourceImpl({
    required this.remoteDataSource,
  });
  @override
  Future<ApiResponse> callLogout(LogoutRequestModel logoutRequestModel) =>
      remoteDataSource.executePost(
        path: LOGOUT_API,
        requestBody: logoutRequestModel.toJson(),
      );
}
