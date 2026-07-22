import 'package:flutter_clean_architecture/features/login/data/model/login_request_model.dart';
import 'package:flutter_clean_architecture/core/const/api_constants.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds.dart';
import 'login_data_source.dart';

class LoginDataSourceImpl extends LoginDataSource {
  final IRemoteDataSource remoteDataSource;

  LoginDataSourceImpl({
    required this.remoteDataSource,
  });
  @override
  Future<ApiResponse> callLogin(LoginRequestModel loginRequestModel) =>
      remoteDataSource.executePost(
        path: LOGIN_API,
        requestBody: loginRequestModel.toJson(),
      );
}
