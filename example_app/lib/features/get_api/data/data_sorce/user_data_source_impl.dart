import 'package:example_app/features/get_api/data/data_sorce/user_data_source.dart';

import '../../../../core/api/data_source/remote_ds/remote_ds.dart';
import '../../../../core/api/model/api_response.dart';
import '../../../../core/const/api_constants.dart';

class UserDataSourceImpl extends UserDataSource {
  late final IRemoteDataSource remoteDataSource;

  UserDataSourceImpl({
    required this.remoteDataSource,
  });

  @override
  Future<ApiResponse> getUserList(userListRequest) => remoteDataSource
      .executeGet(path: GET_USERS, queryParameters: userListRequest.toJson());
}
