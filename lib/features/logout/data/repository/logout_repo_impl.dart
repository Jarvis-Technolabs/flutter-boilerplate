import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds_impl.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/features/logout/data/model/logout_request_model.dart';
import 'package:flutter_clean_architecture/features/logout/data/model/logout_response_model.dart';

import '../../domain/repositories/logout_repo.dart';
import '../data_source/logout_data_source.dart';

class LogoutRepoImpl extends LogoutRepo {
  final LogoutDataSource dataSource;
  final NetworkInfo networkInfo;

  LogoutRepoImpl(
    this.networkInfo,
    this.dataSource,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callLogout(
          LogoutRequestModel logoutRequestModel) =>
      baseApiMethod(
        () => callLogoutApiCall(logoutRequestModel),
      );

  Future<Either<Failure, Success>> callLogoutApiCall(
      LogoutRequestModel logoutRequestModel) async {
    ApiResponse response = await dataSource.callLogout(logoutRequestModel);

    if (!response.status!) {
      return Left(
        ServerFailure(
          errorMessage: response.message!,
          statusCode: response.statusCode ?? 0,
        ),
      );
    } else {
      if (response.data == null) {
        return Right(
          Success(
            data: null,
            message: response.message,
          ),
        );
      } else {
        LogoutResponseModel responseData =
            LogoutResponseModel.fromJson(response.data);
        await commonUtilities.clearData();
        return Right(
          Success(
            data: responseData,
            message: response.message,
          ),
        );
      }
    }
  }
}
