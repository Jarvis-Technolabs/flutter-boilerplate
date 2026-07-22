import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/data_source/network_info/network_info.dart';
import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds_impl.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/const/mock_api_constants.dart';
import 'package:flutter_clean_architecture/features/delete_account/data/model/delete_account_request_model.dart';
import 'package:flutter_clean_architecture/features/delete_account/data/model/delete_account_response_model.dart';

import '../../domain/repositories/delete_account_repo.dart';
import '../data_source/delete_account_data_source.dart';

class MockDeleteAccountRepoImpl extends DeleteAccountRepo {
  final DeleteAccountDataSource dataSource;
  final NetworkInfo networkInfo;

  MockDeleteAccountRepoImpl(
    this.dataSource,
    this.networkInfo,
  ) : super(networkInfo);
  @override
  Future<Either<Failure, Success>> callDeleteAccount(
      DeleteAccountRequestModel deleteAccountRequestModel) async {
    ApiResponse apiResponse = await loadFromAssetData(DELETE_ACCOUNT_API);
    DeleteAccountResponseModel response =
        DeleteAccountResponseModel.fromJson(apiResponse.data);
    await commonUtilities.clearAllData();
    return Right(Success(data: response));
  }
}
