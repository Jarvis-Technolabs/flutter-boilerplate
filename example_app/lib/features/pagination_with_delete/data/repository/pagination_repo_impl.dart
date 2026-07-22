import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:example_app/features/pagination_with_delete/data/model/delete_request_model.dart';
import 'package:example_app/features/pagination_with_delete/data/model/pagination_response.dart';
import 'package:example_app/features/pagination_with_delete/data/model/request_model.dart';

import '../../../../core/api/data_source/network_info/network_info.dart';
import '../../../../core/api/model/api_response.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';

import '../../domain/repositories/pagination_repo.dart';
import '../data_source/pagination_data_source.dart';

class PaginationRepoImpl extends PaginationRepo {
  late final PaginationDataSource paginationDataSource;
  late final NetworkInfo networkInfo;

  PaginationRepoImpl(this.paginationDataSource, this.networkInfo)
      : super(networkInfo);

  @override
  Future<Either<Failure, Success>> getPaginationData(
          PaginationRequestModel paginationRequestModel) =>
      baseApiMethod(() => getPaginationApiCall(paginationRequestModel));

  Future<Either<Failure, Success>> getPaginationApiCall(
      PaginationRequestModel paginationRequestModel) async {
    ApiResponse response =
        await paginationDataSource.getPaginationData(paginationRequestModel);

    if (!response.status!) {
      return Left(
        ServerFailure(
          errorMessage: response.message!,
          statusCode: response.statusCode ?? 0,
        ),
      );
    } else {
      PaginationResponse paginationResponse =
          PaginationResponse.fromJson(response.data);
      return Right(Success(data: paginationResponse));
    }
  }

  @override
  Future<Either<Failure, Success>> deleteItemData(
          DeleteRequestModel deleteRequestModel) =>
      baseApiMethod(() => getDeleteItemDataApiCall(deleteRequestModel));

  Future<Either<Failure, Success>> getDeleteItemDataApiCall(
      DeleteRequestModel deleteRequestModel) async {
    ApiResponse response =
        await paginationDataSource.deleteItemData(deleteRequestModel);

    if (!response.status!) {
      return Left(
        ServerFailure(
          errorMessage: response.message!,
          statusCode: response.statusCode ?? 0,
        ),
      );
    } else {
      return Right(Success(data: response.message));
    }
  }
}
