import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/base_usecases/base_usecase.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/sendOTP_request_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/domain/repositories/otp_verification_repo.dart';

class SendOTPUseCase extends BaseUseCase<Success, SendOTPRequestModel> {
  final OtpVerificationRepo otpVerificationRepo;

  SendOTPUseCase(this.otpVerificationRepo);

  @override
  Future<Either<Failure, Success>> call(SendOTPRequestModel params) =>
      otpVerificationRepo.callSendotp(params);
}
