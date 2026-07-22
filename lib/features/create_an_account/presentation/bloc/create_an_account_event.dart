import 'package:flutter_clean_architecture/features/create_an_account/data/model/signup_request_model.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class CreateAnAccountEvent {}

class SignupEvent extends CreateAnAccountEvent {
  final SignupRequestModel request;
  SignupEvent({required this.request});
}
