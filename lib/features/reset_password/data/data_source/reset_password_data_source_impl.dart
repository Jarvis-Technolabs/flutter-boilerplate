import 'package:flutter_clean_architecture/features/reset_password/data/model/reset_password_request_model.dart';
import 'package:flutter_clean_architecture/core/const/api_constants.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds.dart';
import 'reset_password_data_source.dart';

class ResetPasswordDataSourceImpl extends ResetPasswordDataSource {
  final IRemoteDataSource remoteDataSource;

  ResetPasswordDataSourceImpl({
    required this.remoteDataSource,
  });
  @override
  Future<ApiResponse> callResetPassword(
          ResetPasswordRequestModel resetPasswordRequestModel) =>
      remoteDataSource.executePost(
        path: RESET_PASSWORD_API,
        requestBody: resetPasswordRequestModel.toJson(),
      );
}
