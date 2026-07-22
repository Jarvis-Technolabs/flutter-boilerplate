import 'package:flutter_clean_architecture/features/create_an_account/domain/repositories/create_an_account_repo.dart';
import 'package:flutter_clean_architecture/features/create_an_account/data/model/signup_request_model.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/base_usecases/base_usecase.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/no_request.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';

class SignupUseCase extends BaseUseCase<Success, SignupRequestModel> {
  final CreateAnAccountRepo createAnAccountRepo;

  SignupUseCase(this.createAnAccountRepo);

  @override
  Future<Either<Failure, Success>> call(
          SignupRequestModel signupRequestModel) =>
      createAnAccountRepo.callSignup(signupRequestModel);
}
