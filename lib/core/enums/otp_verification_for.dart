const int REGISTER = 1;
const int FORGOT_PASSWORD = 2;
const int DELETE_ACCOUNT = 3;

enum SendOtpFor {
  REGISTER,
  FORGOT_PASSWORD,
  DELETE_ACCOUNT,
}

extension EnumExtensions on SendOtpFor {
  int? get getSendOtpForValue {
    switch (this) {
      case SendOtpFor.REGISTER:
        return REGISTER;
      case SendOtpFor.FORGOT_PASSWORD:
        return FORGOT_PASSWORD;
      case SendOtpFor.DELETE_ACCOUNT:
        return DELETE_ACCOUNT;
      default:
        return null;
    }
  }
}

extension EnumExtensionsVal on int {
  SendOtpFor? getSendOtpForEnum() {
    switch (this) {
      case REGISTER:
        return SendOtpFor.REGISTER;
      case FORGOT_PASSWORD:
        return SendOtpFor.FORGOT_PASSWORD;
      case DELETE_ACCOUNT:
        return SendOtpFor.DELETE_ACCOUNT;
      default:
        return null;
    }
  }
}
