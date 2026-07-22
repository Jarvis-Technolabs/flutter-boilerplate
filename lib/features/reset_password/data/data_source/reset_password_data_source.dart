import 'package:flutter_clean_architecture/features/reset_password/data/model/reset_password_request_model.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';

abstract class ResetPasswordDataSource {
  Future<ApiResponse> callResetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel);
}
