import 'package:flutter_clean_architecture/features/logout/domain/repositories/logout_repo.dart';
import 'package:flutter_clean_architecture/features/logout/data/model/logout_request_model.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/base_usecases/base_usecase.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/no_request.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';

class LogoutUseCase extends BaseUseCase<Success, LogoutRequestModel> {
  final LogoutRepo logoutRepo;

  LogoutUseCase(this.logoutRepo);

  @override
  Future<Either<Failure, Success>> call(
          LogoutRequestModel logoutRequestModel) =>
      logoutRepo.callLogout(logoutRequestModel);
}
