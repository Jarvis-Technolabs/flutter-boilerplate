import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/const/mock_api_constants.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/preference/preference_helper.dart';
import 'package:flutter_clean_architecture/features/login/data/model/login_request_model.dart';
import 'package:flutter_clean_architecture/features/login/data/model/login_response_model.dart';

import '../../domain/repositories/login_repo.dart';
import '../data_source/login_data_source.dart';

class MockLoginRepoImpl extends LoginRepo {
  final LoginDataSource dataSource;
  final NetworkInfo networkInfo;

  MockLoginRepoImpl(
    this.dataSource,
    this.networkInfo,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callLogin(
      LoginRequestModel loginRequestModel) async {
    ApiResponse apiResponse = await loadFromAssetData(LOGIN_API);
    LoginResponseModel response = LoginResponseModel.fromJson(apiResponse.data);
    PreferenceHelper preferenceHelper = sl();
    await preferenceHelper.setUserToken(response.token ?? '');
    await preferenceHelper.setMobileNo(loginRequestModel.mobileNo ?? '');
    await preferenceHelper.setIsUserLoggedIn(true);
    return Right(Success(data: response));
  }
}
