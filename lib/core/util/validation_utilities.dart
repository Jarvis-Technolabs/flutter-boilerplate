import 'package:flutter_clean_architecture/core/const/app_constants.dart';

class ValidationUtilities {
  bool validPassword(String password) =>
      RegExp(PASSWORD_REGEX).hasMatch(password);

  bool isEmail(String email) => RegExp(EMAIL_REGEX).hasMatch(email);

  bool isOnlyDigits(String input) => RegExp(DIGIT_ONLY_REGEX).hasMatch(input);
}
