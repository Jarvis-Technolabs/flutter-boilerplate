import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../core/api/data_source/network_info/network_info.dart';
import '../../../../core/api/model/api_response.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';
import '../../../../core/device_info/model/device_info_req_model.dart';
import '../../../../core/device_info/repository/device_info_data_source.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/encryption/encryption_repo.dart';
import '../../../../core/flavour/flavour_config.dart';
import '../../../../core/preference/preference_helper.dart';
import '../../domain/repositories/splash_repo.dart';
import '../data_source/get_splash_data_source.dart';
import '../model/generate_public_token_request.dart';
import '../model/get_mobile_config_response.dart';

class GetSplashRepoImpl extends SplashRepo {
  late final GetSplashDataSource getMobileConfigDataSource;
  late final NetworkInfo networkInfo;
  EncryptionRepo encryptionRepo = sl();
  DeviceInfoDataSource deviceInfoDataSource = sl();

  GetSplashRepoImpl(this.getMobileConfigDataSource, this.networkInfo)
      : super(networkInfo);

  @override
  Future<Either<Failure, Success>> getMobileConfig() =>
      baseApiMethod(() => getMobileConfigApiCall());

  Future<Either<Failure, Success>> getMobileConfigApiCall() async {
    ApiResponse response = await getMobileConfigDataSource.getMobileConfig();

    if (!response.status!) {
      return Left(
        ServerFailure(
          errorMessage: response.message!,
          statusCode: response.statusCode ?? 0,
        ),
      );
    } else {
      GetMobileAPPConfigurationResponse userResponse =
          GetMobileAPPConfigurationResponse.fromJson(response.data);
      return Right(Success(data: userResponse));
    }
  }

  @override
  Future<Either<Failure, Success>> generatePublicToken() =>
      baseApiMethod(() => generatePublicTokenApiCall());

  Future<Either<Failure, Success>> generatePublicTokenApiCall() async {
    GeneratePublicTokenRequest generatePublicTokenRequest =
        GeneratePublicTokenRequest();
    DeviceInfoReqModel? deviceInfoReqModel =
        await deviceInfoDataSource.getDeviceInfo();

    generatePublicTokenRequest.userID =
        encryptionRepo.encryptText(deviceInfoReqModel!.deviceId!);
    generatePublicTokenRequest.extraToken = encryptionRepo
        .encryptText(utf8.decode(FlavourConfig.instance!.AES_TOKEN));
    ApiResponse response = await getMobileConfigDataSource
        .generatePublicToken(generatePublicTokenRequest);

    if (!response.status!) {
      return Left(
        ServerFailure(
          errorMessage: response.message!,
          statusCode: response.statusCode ?? 0,
        ),
      );
    } else {
      PreferenceHelper preferenceHelper = sl();
      await preferenceHelper.setPublicToken(response.data);
      return Right(Success(data: response.data));
    }
  }
}
