import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/features/logout/data/model/logout_request_model.dart';

@immutable
abstract class LogoutEvent {}

class LogoutUserEvent extends LogoutEvent {
  final LogoutRequestModel request;
  LogoutUserEvent({required this.request});
}
