import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/sendOTP_request_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/sendOTP_response_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/verifyOTP_request_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/verifyOTP_response_model.dart';

import '../../domain/repositories/otp_verification_repo.dart';
import '../data_source/otp_verification_data_source.dart';

class OtpVerificationRepoImpl extends OtpVerificationRepo {
  final OtpVerificationDataSource dataSource;
  final NetworkInfo networkInfo;

  OtpVerificationRepoImpl(
    this.networkInfo,
    this.dataSource,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callSendotp(
          SendOTPRequestModel sendOTPRequestModel) =>
      baseApiMethod(() => callSendotpApiCall(sendOTPRequestModel));

  Future<Either<Failure, Success>> callSendotpApiCall(
      SendOTPRequestModel sendOTPRequestModel) async {
    ApiResponse response = await dataSource.callSendOtp(sendOTPRequestModel);

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
        SendOTPResponseModel responseData =
            SendOTPResponseModel.fromJson(response.data);
        return Right(Success(data: responseData, message: response.message));
      }
    }
  }

  @override
  Future<Either<Failure, Success>> callVerifyotp(
          VerifyOTPRequestModel verifyOTPRequestModel) =>
      baseApiMethod(() => callVerifyotpApiCall(verifyOTPRequestModel));

  Future<Either<Failure, Success>> callVerifyotpApiCall(
      VerifyOTPRequestModel verifyOTPRequestModel) async {
    ApiResponse response =
        await dataSource.callVerifyOtp(verifyOTPRequestModel);

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
        VerifyOTPResponseModel responseData =
            VerifyOTPResponseModel.fromJson(response.data);
        return Right(Success(data: responseData, message: response.message));
      }
    }
  }
}
