import 'package:flutter_clean_architecture/features/reset_password/data/model/reset_password_request_model.dart';
import 'package:flutter_clean_architecture/features/reset_password/data/model/reset_password_response_model.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import '../../domain/repositories/reset_password_repo.dart';
import '../data_source/reset_password_data_source.dart';

class ResetPasswordRepoImpl extends ResetPasswordRepo {
  final ResetPasswordDataSource dataSource;
  final NetworkInfo networkInfo;

  ResetPasswordRepoImpl(
    this.networkInfo,
    this.dataSource,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callResetPassword(
          ResetPasswordRequestModel resetPasswordRequestModel) =>
      baseApiMethod(() => callResetPasswordApiCall(resetPasswordRequestModel));

  Future<Either<Failure, Success>> callResetPasswordApiCall(
      ResetPasswordRequestModel resetPasswordRequestModel) async {
    ApiResponse response =
        await dataSource.callResetPassword(resetPasswordRequestModel);

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
        ResetPasswordResponseModel responseData =
            ResetPasswordResponseModel.fromJson(response.data);
        return Right(Success(data: responseData, message: response.message));
      }
    }
  }
}
