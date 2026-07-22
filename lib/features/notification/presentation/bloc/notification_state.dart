import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_state.dart';
import 'package:flutter_clean_architecture/features/notification/data/model/get_notification_response_model.dart';

@immutable
class NotificationState extends ApiBaseBlocState {}

class NotificationStateInitialState extends NotificationState {}

class GetNotificationState extends NotificationState {
  final GetNotificationResponseModel response;
  final String message;

  GetNotificationState({required this.response, required this.message});
}

class GetNotificationErrorState extends NotificationState {
  final String message;
  final int statusCode;

  GetNotificationErrorState({
    required this.message,
    required this.statusCode,
  });
}

class GetNotificationNextPageErrorState extends NotificationState {
  final String message;
  final int statusCode;

  GetNotificationNextPageErrorState({
    required this.message,
    required this.statusCode,
  });
}

class GetNotificationDataLoadingState extends NotificationState {}
