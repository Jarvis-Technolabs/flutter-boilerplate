import 'package:flutter_clean_architecture/features/login/data/model/login_request_model.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';

abstract class LoginDataSource {
  Future<ApiResponse> callLogin(LoginRequestModel loginRequestModel);
}
