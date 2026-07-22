import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/preference/preference_helper.dart';
import 'package:flutter_clean_architecture/features/create_an_account/data/model/signup_request_model.dart';
import 'package:flutter_clean_architecture/features/create_an_account/data/model/signup_response_model.dart';

import '../../domain/repositories/create_an_account_repo.dart';
import '../data_source/create_an_account_data_source.dart';

class CreateAnAccountRepoImpl extends CreateAnAccountRepo {
  final CreateAnAccountDataSource dataSource;
  final NetworkInfo networkInfo;

  CreateAnAccountRepoImpl(
    this.networkInfo,
    this.dataSource,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callSignup(
          SignupRequestModel signupRequestModel) =>
      baseApiMethod(() => callSignupApiCall(signupRequestModel));

  Future<Either<Failure, Success>> callSignupApiCall(
      SignupRequestModel signupRequestModel) async {
    ApiResponse response = await dataSource.callSignup(signupRequestModel);

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
        SignupResponseModel responseData =
            SignupResponseModel.fromJson(response.data);
        PreferenceHelper preferenceHelper = sl();
        await preferenceHelper.setUserToken(responseData.token ?? '');
        await preferenceHelper.setMobileNo(signupRequestModel.mobileNo ?? '');
        await preferenceHelper.setIsUserLoggedIn(true);
        return Right(Success(data: responseData, message: response.message));
      }
    }
  }
}
