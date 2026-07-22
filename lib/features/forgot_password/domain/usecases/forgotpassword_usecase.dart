import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/base_usecases/base_usecase.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_request_model.dart';
import 'package:flutter_clean_architecture/features/forgot_password/domain/repositories/forgot_password_repo.dart';

class ForgotPasswordUseCase
    extends BaseUseCase<Success, ForgotPasswordRequestModel> {
  final ForgotPasswordRepo forgotPasswordRepo;

  ForgotPasswordUseCase(this.forgotPasswordRepo);

  @override
  Future<Either<Failure, Success>> call(ForgotPasswordRequestModel params) =>
      forgotPasswordRepo.callForgotpassword(params);
}
