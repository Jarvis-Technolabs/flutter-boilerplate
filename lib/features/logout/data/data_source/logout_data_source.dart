import 'package:flutter_clean_architecture/features/logout/data/model/logout_request_model.dart';
import 'package:flutter_clean_architecture/core/api/model/api_response.dart';

abstract class LogoutDataSource {
  Future<ApiResponse> callLogout(LogoutRequestModel logoutRequestModel);
}
