import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/sendOTP_request_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/verifyOTP_request_model.dart';

abstract class OtpVerificationDataSource {
  Future<ApiResponse> callSendOtp(SendOTPRequestModel sendOTPRequestModel);
  Future<ApiResponse> callVerifyOtp(
      VerifyOTPRequestModel verifyOTPRequestModel);
}
