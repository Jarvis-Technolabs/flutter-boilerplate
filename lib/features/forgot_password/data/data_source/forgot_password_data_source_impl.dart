import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/const/api_constants.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_request_model.dart';

import 'forgot_password_data_source.dart';

class ForgotPasswordDataSourceImpl extends ForgotPasswordDataSource {
  final IRemoteDataSource remoteDataSource;

  ForgotPasswordDataSourceImpl({
    required this.remoteDataSource,
  });
  @override
  Future<ApiResponse> callForgotPassword(
          ForgotPasswordRequestModel forgotPasswordRequestModel) =>
      remoteDataSource.executePost(
        path: FORGOT_PASSWORD_API,
        requestBody: forgotPasswordRequestModel.toJson(),
      );
}
