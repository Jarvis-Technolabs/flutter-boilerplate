class PhoneAuthRequest {
  final String phoneNumber;
  final Function(dynamic model)? listenForData;
  final int? resendOtpToken;

  PhoneAuthRequest({
    required this.phoneNumber,
    this.listenForData,
    this.resendOtpToken,
  });
}
