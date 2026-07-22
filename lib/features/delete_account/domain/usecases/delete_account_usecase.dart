import 'package:flutter_clean_architecture/features/delete_account/domain/repositories/delete_account_repo.dart';
import 'package:flutter_clean_architecture/features/delete_account/data/model/delete_account_request_model.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/api/base_usecases/base_usecase.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/no_request.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';

class DeleteAccountUseCase
    extends BaseUseCase<Success, DeleteAccountRequestModel> {
  final DeleteAccountRepo deleteAccountRepo;

  DeleteAccountUseCase(this.deleteAccountRepo);

  @override
  Future<Either<Failure, Success>> call(
          DeleteAccountRequestModel deleteAccountRequestModel) =>
      deleteAccountRepo.callDeleteAccount(deleteAccountRequestModel);
}
