import 'package:dartz/dartz.dart';
import 'package:example_app/features/firebase_phone_auth/data/model/verify_otp_request.dart';

import '../../../../core/api/base_usecases/base_usecase.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';
import '../repositories/phone_auth_repo.dart';

class VerifyOtpUseCase extends BaseUseCase<Success, VerifyOtpRequest> {
  late final PhoneAuthRepo getPhoneAuthRepo;

  VerifyOtpUseCase(this.getPhoneAuthRepo);

  @override
  Future<Either<Failure, Success>> call(
    VerifyOtpRequest request,
  ) =>
      getPhoneAuthRepo.verifyOtp(request);
}
