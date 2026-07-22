import 'package:flutter_clean_architecture/features/logout/data/model/logout_request_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/repository/base_api_repo.dart';

abstract class LogoutRepo extends BaseApiRepo {
  LogoutRepo(NetworkInfo networkInfo) : super(networkInfo: networkInfo);
  Future<Either<Failure, Success>> callLogout(
      LogoutRequestModel logoutRequestModel);
}
