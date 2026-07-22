import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/features/notification/data/model/get_notification_request_model.dart';

@immutable
abstract class NotificationEvent {}

class GetNotificationEvent extends NotificationEvent {
  final GetNotificationRequest getNotificationRequest;
  final bool isNextPageCall;

  GetNotificationEvent({
    required this.getNotificationRequest,
    required this.isNextPageCall,
  });
}
