import 'package:dartz/dartz.dart';
import 'package:example_app/features/get_api/domain/repositories/user_api_repo.dart';

import '../../../../core/api/base_usecases/base_usecase.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';
import '../../data/model/user_list_request.dart';

class UserApiUseCase extends BaseUseCase<Success, UserListRequest> {
  late final UserRepo getUserRepo;

  UserApiUseCase(this.getUserRepo);

  @override
  Future<Either<Failure, Success>> call(UserListRequest request) =>
      getUserRepo.getUserList(request);
}
