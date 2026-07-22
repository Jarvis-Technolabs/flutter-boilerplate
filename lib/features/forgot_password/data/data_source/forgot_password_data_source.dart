import 'package:flutter_clean_architecture/core/api/model/api_response.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_request_model.dart';

abstract class ForgotPasswordDataSource {
  Future<ApiResponse> callForgotPassword(
    ForgotPasswordRequestModel forgotPasswordRequestModel,
  );
}
