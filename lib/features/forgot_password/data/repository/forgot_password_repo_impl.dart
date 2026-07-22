import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_request_model.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_response_model.dart';

import '../../domain/repositories/forgot_password_repo.dart';
import '../data_source/forgot_password_data_source.dart';

class ForgotPasswordRepoImpl extends ForgotPasswordRepo {
  final ForgotPasswordDataSource dataSource;
  final NetworkInfo networkInfo;

  ForgotPasswordRepoImpl(
    this.networkInfo,
    this.dataSource,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callForgotpassword(
          ForgotPasswordRequestModel forgotPasswordRequestModel) =>
      baseApiMethod(
          () => callForgotpasswordApiCall(forgotPasswordRequestModel));

  Future<Either<Failure, Success>> callForgotpasswordApiCall(
      ForgotPasswordRequestModel forgotPasswordRequestModel) async {
    ApiResponse response =
        await dataSource.callForgotPassword(forgotPasswordRequestModel);

    if (!response.status!) {
      return Left(
        ServerFailure(
          errorMessage: response.message!,
          statusCode: response.statusCode ?? 0,
        ),
      );
    } else {
      if (response.data == null) {
        return Right(Success(data: null, message: response.message));
      } else {
        ForgotPasswordResponseModel responseData =
            ForgotPasswordResponseModel.fromJson(response.data);
        return Right(Success(data: responseData, message: response.message));
      }
    }
  }
}
