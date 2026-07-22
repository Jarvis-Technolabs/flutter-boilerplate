import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/features/login/data/model/login_request_model.dart';

@immutable
abstract class LoginEvent {}

class LoginRequestEvent extends LoginEvent {
  final LoginRequestModel request;
  LoginRequestEvent({
    required this.request,
  });
}

class PublicTokenEvent extends LoginEvent {
  final LoginRequestModel request;
  PublicTokenEvent({
    required this.request,
  });
}
