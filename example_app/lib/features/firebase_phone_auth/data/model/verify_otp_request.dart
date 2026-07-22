class VerifyOtpRequest {
  final String verificationID;
  final String otp;

  VerifyOtpRequest({
    required this.verificationID,
    required this.otp,
  });
}
