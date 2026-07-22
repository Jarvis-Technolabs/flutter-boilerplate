import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/api/repository/base_api_repo.dart';
import 'package:flutter_clean_architecture/features/notification/data/model/get_notification_request_model.dart';

abstract class NotificationRepo extends BaseApiRepo {
  NotificationRepo(NetworkInfo networkInfo) : super(networkInfo: networkInfo);
  Future<Either<Failure, Success>> callGetNotification({
    required GetNotificationRequest getNotificationRequest,
  });
}
