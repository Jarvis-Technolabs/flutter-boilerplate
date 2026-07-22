import 'package:dartz/dartz.dart';
import 'package:example_app/core/const/string_constants.dart';
import 'package:example_app/features/get_api/data/data_sorce/user_data_source.dart';
import 'package:example_app/features/get_api/data/model/user_list_request.dart';
import 'package:example_app/features/get_api/data/model/user_list_response.dart';
import 'package:example_app/features/get_api/domain/repositories/user_api_repo.dart';

import '../../../../core/api/data_source/network_info/network_info.dart';
import '../../../../core/api/model/api_response.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';

class UserRepoImpl extends UserRepo {
  late final UserDataSource userDataSource;
  late final NetworkInfo networkInfo;

  UserRepoImpl(
    this.userDataSource,
    this.networkInfo,
  ) : super(networkInfo);

  @override
  Future<Either<Failure, Success>> getUserList(request) =>
      baseApiMethod(() => getUserListApiCall(request: request));

  Future<Either<Failure, Success>> getUserListApiCall(
      {required UserListRequest request}) async {
    ApiResponse response = await userDataSource.getUserList(request);

    if (response.data == null) {
      return Left(
        ServerFailure(
          errorMessage: LABEL_SOMETHING_WENT_WRONG,
          statusCode: 404,
        ),
      );
    } else {
      List<Data> userList = [];
      response.data.forEach((element) {
        userList.add(Data.fromJson(element));
      });

      UserListResponse userListResponse = UserListResponse(
          perPage: response.perPage,
          total: response.total,
          totalPages: response.totalPages,
          data: userList);
      return Right(Success(data: userListResponse));
    }
  }
}
