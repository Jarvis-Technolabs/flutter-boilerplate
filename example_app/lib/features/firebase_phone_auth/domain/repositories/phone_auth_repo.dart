import 'package:dartz/dartz.dart';

import '../../../../core/api/data_source/network_info/network_info.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';
import '../../../../core/api/repository/base_api_repo.dart';
import '../../data/model/verify_otp_request.dart';

abstract class PhoneAuthRepo extends BaseApiRepo {
  PhoneAuthRepo(NetworkInfo networkInfo) : super(networkInfo: networkInfo);

  Future<void> getPhoneAuthOTP(request);

  Future<Either<Failure, Success>> verifyOtp(
    VerifyOtpRequest request,
  );
}
