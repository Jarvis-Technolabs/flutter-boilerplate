const int MOBILE = 1;
const int EMAIL = 2;

enum SendOtpTo {
  Mobile,
  Email,
}

extension EnumExtensions on SendOtpTo {
  int? get getSendOtpToValue {
    switch (this) {
      case SendOtpTo.Mobile:
        return MOBILE;
      case SendOtpTo.Email:
        return EMAIL;
      default:
        return null;
    }
  }
}

extension EnumExtensionsVal on int {
  SendOtpTo? getSendOtpToEnum() {
    switch (this) {
      case MOBILE:
        return SendOtpTo.Mobile;
      case EMAIL:
        return SendOtpTo.Email;
      default:
        return null;
    }
  }
}
