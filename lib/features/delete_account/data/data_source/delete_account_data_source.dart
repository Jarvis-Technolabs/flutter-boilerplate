import 'package:flutter_clean_architecture/features/delete_account/data/model/delete_account_request_model.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';

abstract class DeleteAccountDataSource {
  Future<ApiResponse> callDeleteAccount(
      DeleteAccountRequestModel deleteAccountRequestModel);
}
