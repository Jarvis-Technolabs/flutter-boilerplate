import 'package:flutter_clean_architecture/features/reset_password/data/model/reset_password_request_model.dart';
import 'package:flutter_clean_architecture/features/reset_password/data/model/reset_password_response_model.dart';
import 'package:flutter_clean_architecture/core/const/mock_api_constants.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';

import '../../domain/repositories/reset_password_repo.dart';
import '../data_source/reset_password_data_source.dart';

class MockResetPasswordRepoImpl extends ResetPasswordRepo {
  final ResetPasswordDataSource dataSource;
  final NetworkInfo networkInfo;

  MockResetPasswordRepoImpl(
    this.dataSource,
    this.networkInfo,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callResetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel) async {
    ApiResponse apiResponse = await loadFromAssetData(RESET_PASSWORD_API);
    ResetPasswordResponseModel response =
        ResetPasswordResponseModel.fromJson(apiResponse.data);
    return Right(Success(data: response));
  }
}
