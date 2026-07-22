import 'package:flutter_clean_architecture/features/create_an_account/data/model/signup_request_model.dart';
import 'package:flutter_clean_architecture/core/const/api_constants.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds.dart';
import 'create_an_account_data_source.dart';

class CreateAnAccountDataSourceImpl extends CreateAnAccountDataSource {
  final IRemoteDataSource remoteDataSource;

  CreateAnAccountDataSourceImpl({
    required this.remoteDataSource,
  });
  @override
  Future<ApiResponse> callSignup(SignupRequestModel signupRequestModel) =>
      remoteDataSource.executePost(
        path: SIGNUP_API,
        requestBody: signupRequestModel.toJson(),
      );
}
