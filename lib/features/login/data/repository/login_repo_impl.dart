import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/preference/preference_helper.dart';
import 'package:flutter_clean_architecture/features/login/data/model/login_request_model.dart';
import 'package:flutter_clean_architecture/features/login/data/model/login_response_model.dart';

import '../../domain/repositories/login_repo.dart';
import '../data_source/login_data_source.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginDataSource dataSource;
  final NetworkInfo networkInfo;

  LoginRepoImpl(
    this.networkInfo,
    this.dataSource,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callLogin(
          LoginRequestModel loginRequestModel) =>
      baseApiMethod(
        () => callLoginApiCall(loginRequestModel),
      );

  Future<Either<Failure, Success>> callLoginApiCall(
      LoginRequestModel loginRequestModel) async {
    ApiResponse response = await dataSource.callLogin(loginRequestModel);
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
        LoginResponseModel responseData =
            LoginResponseModel.fromJson(response.data);
        PreferenceHelper preferenceHelper = sl();
        await preferenceHelper.setUserToken(responseData.token ?? '');
        await preferenceHelper.setMobileNo(loginRequestModel.mobileNo ?? '');
        await preferenceHelper.setIsUserLoggedIn(true);
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
