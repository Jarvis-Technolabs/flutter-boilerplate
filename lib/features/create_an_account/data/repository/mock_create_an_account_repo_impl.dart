import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/const/mock_api_constants.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/preference/preference_helper.dart';
import 'package:flutter_clean_architecture/features/create_an_account/data/model/signup_request_model.dart';
import 'package:flutter_clean_architecture/features/create_an_account/data/model/signup_response_model.dart';

import '../../domain/repositories/create_an_account_repo.dart';
import '../data_source/create_an_account_data_source.dart';

class MockCreateAnAccountRepoImpl extends CreateAnAccountRepo {
  final CreateAnAccountDataSource dataSource;
  final NetworkInfo networkInfo;

  MockCreateAnAccountRepoImpl(
    this.dataSource,
    this.networkInfo,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callSignup(
      SignupRequestModel signupRequestModel) async {
    ApiResponse apiResponse = await loadFromAssetData(SIGNUP_API);
    SignupResponseModel response =
        SignupResponseModel.fromJson(apiResponse.data);
    PreferenceHelper preferenceHelper = sl();
    await preferenceHelper.setUserToken(response.token ?? '');
    await preferenceHelper.setMobileNo(signupRequestModel.mobileNo ?? '');
    await preferenceHelper.setIsUserLoggedIn(true);
    return Right(Success(data: response));
  }
}
