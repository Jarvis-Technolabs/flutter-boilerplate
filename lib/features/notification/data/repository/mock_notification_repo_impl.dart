import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/const/mock_api_constants.dart';
import 'package:flutter_clean_architecture/features/notification/data/model/get_notification_request_model.dart';
import 'package:flutter_clean_architecture/features/notification/data/model/get_notification_response_model.dart';

import '../../domain/repositories/notification_repo.dart';
import '../data_source/notification_data_source.dart';

class MockNotificationRepoImpl extends NotificationRepo {
  final NotificationDataSource dataSource;
  final NetworkInfo networkInfo;

  MockNotificationRepoImpl(
    this.dataSource,
    this.networkInfo,
  ) : super(networkInfo);

  @override
  Future<Either<Failure, Success>> callGetNotification(
      {required GetNotificationRequest getNotificationRequest}) async {
    ApiResponse apiResponse = await loadFromAssetData(GET_NOTIFICATION_API);
    GetNotificationResponseModel response =
        GetNotificationResponseModel.fromJson(apiResponse.data);
    return Right(Success(data: response));
  }
}
