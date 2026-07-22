class PhoneAuthResponse {
  String verificationID;
  int? resendOtpToken;

  PhoneAuthResponse({
    required this.verificationID,
    required this.resendOtpToken,
  });
}
