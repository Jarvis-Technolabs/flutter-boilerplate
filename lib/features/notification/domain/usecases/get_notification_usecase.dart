import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/base_usecases/base_usecase.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/features/notification/data/model/get_notification_request_model.dart';
import 'package:flutter_clean_architecture/features/notification/domain/repositories/notification_repo.dart';

class GetNotificationUseCase
    extends BaseUseCase<Success, GetNotificationRequest> {
  final NotificationRepo notificationRepo;

  GetNotificationUseCase(this.notificationRepo);

  @override
  Future<Either<Failure, Success>> call(
          GetNotificationRequest getNotificationRequest) =>
      notificationRepo.callGetNotification(
        getNotificationRequest: getNotificationRequest,
      );
}
