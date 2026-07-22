import 'package:flutter_clean_architecture/features/reset_password/domain/repositories/reset_password_repo.dart';
import 'package:flutter_clean_architecture/features/reset_password/data/model/reset_password_request_model.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/base_usecases/base_usecase.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/no_request.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';

class ResetPasswordUseCase
    extends BaseUseCase<Success, ResetPasswordRequestModel> {
  final ResetPasswordRepo resetPasswordRepo;

  ResetPasswordUseCase(this.resetPasswordRepo);

  @override
  Future<Either<Failure, Success>> call(
          ResetPasswordRequestModel resetPasswordRequestModel) =>
      resetPasswordRepo.callResetPassword(resetPasswordRequestModel);
}
