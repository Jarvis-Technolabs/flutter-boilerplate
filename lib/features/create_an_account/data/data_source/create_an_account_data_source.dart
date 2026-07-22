import 'package:flutter_clean_architecture/features/create_an_account/data/model/signup_request_model.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';

abstract class CreateAnAccountDataSource {
  Future<ApiResponse> callSignup(SignupRequestModel signupRequestModel);
}
