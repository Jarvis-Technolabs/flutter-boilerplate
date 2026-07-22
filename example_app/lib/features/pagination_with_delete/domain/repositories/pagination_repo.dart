import 'package:dartz/dartz.dart';
import 'package:example_app/features/pagination_with_delete/data/model/delete_request_model.dart';
import 'package:example_app/features/pagination_with_delete/data/model/request_model.dart';

import '../../../../core/api/data_source/network_info/network_info.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';
import '../../../../core/api/repository/base_api_repo.dart';

abstract class PaginationRepo extends BaseApiRepo {
  PaginationRepo(NetworkInfo networkInfo) : super(networkInfo: networkInfo);

  Future<Either<Failure, Success>> getPaginationData(
      PaginationRequestModel paginationRequestModel);

  Future<Either<Failure, Success>> deleteItemData(
      DeleteRequestModel deleteRequestModel);
}
