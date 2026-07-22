import 'package:flutter_clean_architecture/features/otp_verification/data/model/verifyOTP_request_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/verifyOTP_response_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/sendOTP_request_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/sendOTP_response_model.dart';
import 'package:flutter_clean_architecture/core/const/mock_api_constants.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';

import '../../domain/repositories/otp_verification_repo.dart';
import '../data_source/otp_verification_data_source.dart';

class MockOtpVerificationRepoImpl extends OtpVerificationRepo {
  final OtpVerificationDataSource dataSource;
  final NetworkInfo networkInfo;

  MockOtpVerificationRepoImpl(
    this.dataSource,
    this.networkInfo,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callSendotp(
      SendOTPRequestModel sendOTPRequestModel) async {
    ApiResponse apiResponse = await loadFromAssetData(SENDOTP_API);
    SendOTPResponseModel response =
        SendOTPResponseModel.fromJson(apiResponse.data);
    return Right(Success(data: response));
  }

  @override
  Future<Either<Failure, Success>> callVerifyotp(
      VerifyOTPRequestModel verifyOTPRequestModel) async {
    ApiResponse apiResponse = await loadFromAssetData(VERIFYOTP_API);
    VerifyOTPResponseModel response =
        VerifyOTPResponseModel.fromJson(apiResponse.data);
    return Right(Success(data: response));
  }
}
