import 'package:dartz/dartz.dart';
import 'package:example_app/core/const/api_constants.dart';
import 'package:example_app/core/const/string_constants.dart';
import 'package:example_app/features/firebase_phone_auth/data/model/phone_auth_request.dart';
import 'package:example_app/features/firebase_phone_auth/data/model/phone_auth_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/api/data_source/network_info/network_info.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';
import '../../domain/repositories/phone_auth_repo.dart';
import '../model/verify_otp_request.dart';

class PhoneAuthRepoImpl extends PhoneAuthRepo {
  late final NetworkInfo networkInfo;

  PhoneAuthRepoImpl(
    this.networkInfo,
  ) : super(networkInfo);

  @override
  Future<void> getPhoneAuthOTP(request) => getPhoneAuthOTPHandler(
        request: request,
      );

  /// Below method is used to fetch otp/ Resend otp for phone authentication
  Future<void> getPhoneAuthOTPHandler(
      {required PhoneAuthRequest request}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      forceResendingToken: request
          .resendOtpToken, // while resend otp this token is not null else null
      phoneNumber: request.phoneNumber,
      timeout: const Duration(seconds: 30),
      verificationCompleted: (AuthCredential authCredential) {},
      verificationFailed: (FirebaseAuthException authException) {
        /// pass the failure object to the callback
        request.listenForData!(
          Left(
            ServerFailure(
              errorMessage: authException.message ?? "",
              statusCode: LOCAL_ERROR_CODE,
            ),
          ),
        );
      },
      codeSent: (
        String verId,
        int? forceCodeResent,
      ) {
        /// pass the success object to the callback

        request.listenForData!(
          Right(
            Success(
              data: PhoneAuthResponse(
                verificationID: verId,
                resendOtpToken: forceCodeResent,
              ),
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verId) {},
    );
  }

  @override
  Future<Either<Failure, Success>> verifyOtp(VerifyOtpRequest request) =>
      baseApiMethod(
        () => (verifyOtpWithFirebaseHandler(request)),
      );

  /// Below method is used to verify otp for phone authentication

  Future<Either<Failure, Success>> verifyOtpWithFirebaseHandler(
    VerifyOtpRequest request,
  ) async {
    UserCredential credential =
        await FirebaseAuth.instance.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: request.verificationID,
        smsCode: request.otp,
      ),
    );
    if (credential == null) {
      return Left(
        ServerFailure(
          errorMessage: LABEL_SOMETHING_WENT_WRONG,
          statusCode: LOCAL_ERROR_CODE,
        ),
      );
    } else {
      return Right(
        Success(data: credential),
      );
    }
  }
}
