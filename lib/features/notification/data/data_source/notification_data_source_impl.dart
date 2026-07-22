import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/const/api_constants.dart';
import 'package:flutter_clean_architecture/features/notification/data/model/get_notification_request_model.dart';

import 'notification_data_source.dart';

class NotificationDataSourceImpl extends NotificationDataSource {
  final IRemoteDataSource remoteDataSource;

  NotificationDataSourceImpl({
    required this.remoteDataSource,
  });
  @override
  Future<ApiResponse> callGetNotification({
    required GetNotificationRequest getNotificationRequest,
  }) =>
      remoteDataSource.executePost(
        path: GET_NOTIFICATION_API,
        requestBody: getNotificationRequest.toJson(),
      );
}
