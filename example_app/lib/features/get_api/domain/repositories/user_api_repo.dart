import 'package:dartz/dartz.dart';

import '../../../../core/api/data_source/network_info/network_info.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';
import '../../../../core/api/repository/base_api_repo.dart';

abstract class UserRepo extends BaseApiRepo {
  UserRepo(NetworkInfo networkInfo) : super(networkInfo: networkInfo);

  Future<Either<Failure, Success>> getUserList(request);
}
