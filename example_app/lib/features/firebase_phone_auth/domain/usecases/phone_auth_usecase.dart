import 'package:example_app/features/firebase_phone_auth/data/model/phone_auth_request.dart';

import '../repositories/phone_auth_repo.dart';

class PhoneAuthUseCase {
  late final PhoneAuthRepo getPhoneAuthRepo;

  PhoneAuthUseCase(this.getPhoneAuthRepo);

  Future<void> sendOTP(PhoneAuthRequest request) =>
      getPhoneAuthRepo.getPhoneAuthOTP(request);
}
