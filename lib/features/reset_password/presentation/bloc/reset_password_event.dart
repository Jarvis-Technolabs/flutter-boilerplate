import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/features/reset_password/data/model/reset_password_request_model.dart';

@immutable
abstract class ResetPasswordEvent {}

class ResetPassword extends ResetPasswordEvent {
  final ResetPasswordRequestModel request;
  ResetPassword({required this.request});
}
