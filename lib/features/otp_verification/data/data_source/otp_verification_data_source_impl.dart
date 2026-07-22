import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/const/api_constants.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/sendOTP_request_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/verifyOTP_request_model.dart';

import 'otp_verification_data_source.dart';

class OtpVerificationDataSourceImpl extends OtpVerificationDataSource {
  final IRemoteDataSource remoteDataSource;

  OtpVerificationDataSourceImpl({
    required this.remoteDataSource,
  });
  @override
  Future<ApiResponse> callSendOtp(SendOTPRequestModel sendOTPRequestModel) =>
      remoteDataSource.executePost(
        path: SEND_OTP_API,
        requestBody: sendOTPRequestModel.toJson(),
      );
  @override
  Future<ApiResponse> callVerifyOtp(
          VerifyOTPRequestModel verifyOTPRequestModel) =>
      remoteDataSource.executePost(
        path: VERIFY_OTP_API,
        requestBody: verifyOTPRequestModel.toJson(),
      );
}
