import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_request_model.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_response_model.dart';
import 'package:flutter_clean_architecture/core/const/mock_api_constants.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';

import '../../domain/repositories/forgot_password_repo.dart';
import '../data_source/forgot_password_data_source.dart';

class MockForgotPasswordRepoImpl extends ForgotPasswordRepo {
  final ForgotPasswordDataSource dataSource;
  final NetworkInfo networkInfo;

  MockForgotPasswordRepoImpl(
    this.dataSource,
    this.networkInfo,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callForgotpassword(
      ForgotPasswordRequestModel forgotPasswordRequestModel) async {
    ApiResponse apiResponse = await loadFromAssetData(FORGOTPASSWORD_API);
    ForgotPasswordResponseModel response =
        ForgotPasswordResponseModel.fromJson(apiResponse.data);
    return Right(Success(data: response));
  }
}
