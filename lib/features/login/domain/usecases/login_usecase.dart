import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/base_usecases/base_usecase.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/features/login/data/model/login_request_model.dart';
import 'package:flutter_clean_architecture/features/login/domain/repositories/login_repo.dart';

class LoginUseCase extends BaseUseCase<Success, LoginRequestModel> {
  final LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  @override
  Future<Either<Failure, Success>> call(LoginRequestModel loginRequestModel) =>
      loginRepo.callLogin(loginRequestModel);
}
