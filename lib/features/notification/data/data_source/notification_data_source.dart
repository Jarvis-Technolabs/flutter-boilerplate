import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/features/notification/data/model/get_notification_request_model.dart';

abstract class NotificationDataSource {
  Future<ApiResponse> callGetNotification({
    required GetNotificationRequest getNotificationRequest,
  });
}
