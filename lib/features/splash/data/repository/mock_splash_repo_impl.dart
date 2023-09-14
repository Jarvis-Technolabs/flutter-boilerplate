import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/features/splash/data/data_source/get_splash_data_source.dart';
import 'package:flutter_clean_architecture/features/splash/data/model/get_mobile_config_response.dart';
import 'package:flutter_clean_architecture/features/splash/domain/repositories/splash_repo.dart';

import '../../../../core/api/data_source/network_info/network_info.dart';
import '../../../../core/api/model/api_response.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';
import '../../../../core/const/mock_api_constants.dart';

class MockSplashRepoImpl extends SplashRepo {
  late final GetSplashDataSource getMobileConfigDataSource;
  late final NetworkInfo networkInfo;

  MockSplashRepoImpl(this.getMobileConfigDataSource, this.networkInfo)
      : super(networkInfo);

  @override
  Future<Either<Failure, Success>> getMobileConfig() async {
    ApiResponse attractionData = await loadFromAssetData(SPLASH_API);
    GetMobileAPPConfigurationResponse getMobileAPPConfigurationResponse =
        GetMobileAPPConfigurationResponse.fromJson(attractionData.data);
    return Right(Success(data: getMobileAPPConfigurationResponse));
  }

  @override
  Future<Either<Failure, Success>> generatePublicToken() async {
    ApiResponse attractionData = await loadFromAssetData(SPLASH_API);
    GetMobileAPPConfigurationResponse getMobileAPPConfigurationResponse =
        GetMobileAPPConfigurationResponse.fromJson(attractionData.data);
    return Right(Success(data: getMobileAPPConfigurationResponse));
  }
}
