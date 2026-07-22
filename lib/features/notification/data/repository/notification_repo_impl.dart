import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/features/notification/data/model/get_notification_request_model.dart';
import 'package:flutter_clean_architecture/features/notification/data/model/get_notification_response_model.dart';

import '../../domain/repositories/notification_repo.dart';
import '../data_source/notification_data_source.dart';

class NotificationRepoImpl extends NotificationRepo {
  final NotificationDataSource dataSource;
  final NetworkInfo networkInfo;

  NotificationRepoImpl(
    this.networkInfo,
    this.dataSource,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callGetNotification(
          {required GetNotificationRequest getNotificationRequest}) =>
      baseApiMethod(
        () => callGetNotificationApiCall(
          getNotificationRequest: getNotificationRequest,
        ),
      );

  Future<Either<Failure, Success>> callGetNotificationApiCall({
    required GetNotificationRequest getNotificationRequest,
  }) async {
    ApiResponse response = await dataSource.callGetNotification(
        getNotificationRequest: getNotificationRequest);

    if (!response.status!) {
      return Left(
        ServerFailure(
          errorMessage: response.message!,
          statusCode: response.statusCode ?? 0,
        ),
      );
    } else {
      if (response.data == null) {
        return Right(Success(data: null, message: response.message));
      } else {
        GetNotificationResponseModel responseData =
            GetNotificationResponseModel.fromJson(response.data);
        return Right(Success(data: responseData, message: response.message));
      }
    }
  }
}
