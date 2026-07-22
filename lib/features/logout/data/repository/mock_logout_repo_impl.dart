import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds_impl.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/const/mock_api_constants.dart';
import 'package:flutter_clean_architecture/features/logout/data/model/logout_request_model.dart';
import 'package:flutter_clean_architecture/features/logout/data/model/logout_response_model.dart';

import '../../domain/repositories/logout_repo.dart';
import '../data_source/logout_data_source.dart';

class MockLogoutRepoImpl extends LogoutRepo {
  final LogoutDataSource dataSource;
  final NetworkInfo networkInfo;

  MockLogoutRepoImpl(
    this.dataSource,
    this.networkInfo,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callLogout(
      LogoutRequestModel logoutRequestModel) async {
    ApiResponse apiResponse = await loadFromAssetData(LOGOUT_API);
    LogoutResponseModel response =
        LogoutResponseModel.fromJson(apiResponse.data);
    await commonUtilities.clearData();
    return Right(Success(data: response));
  }
}
