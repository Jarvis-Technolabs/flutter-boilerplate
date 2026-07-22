import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds_impl.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/features/delete_account/data/model/delete_account_request_model.dart';
import 'package:flutter_clean_architecture/features/delete_account/data/model/delete_account_response_model.dart';

import '../../domain/repositories/delete_account_repo.dart';
import '../data_source/delete_account_data_source.dart';

class DeleteAccountRepoImpl extends DeleteAccountRepo {
  final DeleteAccountDataSource dataSource;
  final NetworkInfo networkInfo;

  DeleteAccountRepoImpl(
    this.networkInfo,
    this.dataSource,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callDeleteAccount(
          DeleteAccountRequestModel deleteAccountRequestModel) =>
      baseApiMethod(() => callDeleteAccountApiCall(deleteAccountRequestModel));

  Future<Either<Failure, Success>> callDeleteAccountApiCall(
      DeleteAccountRequestModel deleteAccountRequestModel) async {
    ApiResponse response =
        await dataSource.callDeleteAccount(deleteAccountRequestModel);

    if (!response.status!) {
      return Left(
        ServerFailure(
          errorMessage: response.message!,
          statusCode: response.statusCode ?? 0,
        ),
      );
    } else {
      if (response.data == null) {
        return Right(
          Success(
            data: null,
            message: response.message,
          ),
        );
      } else {
        DeleteAccountResponseModel responseData =
            DeleteAccountResponseModel.fromJson(
          response.data,
        );
        await commonUtilities.clearAllData();
        return Right(
          Success(
            data: responseData,
            message: response.message,
          ),
        );
      }
    }
  }
}
