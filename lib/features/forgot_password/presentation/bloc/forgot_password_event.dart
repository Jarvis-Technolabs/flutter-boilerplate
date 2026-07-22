import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_request_model.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ForgotPasswordEvent {}

class ForgotpasswordEvent extends ForgotPasswordEvent {
  final ForgotPasswordRequestModel request;
  ForgotpasswordEvent({required this.request});
}
