import 'package:example_app/features/get_api/data/model/user_list_request.dart';

import '../../../../core/api/model/api_response.dart';

abstract class UserDataSource {
  Future<ApiResponse> getUserList(
    UserListRequest userListRequest,
  );
}
