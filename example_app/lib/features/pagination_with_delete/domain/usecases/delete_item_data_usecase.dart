import 'package:dartz/dartz.dart';
import 'package:example_app/features/pagination_with_delete/data/model/delete_request_model.dart';

import '../../../../core/api/base_usecases/base_usecase.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';
import '../repositories/pagination_repo.dart';

class DeleteItemDataUseCase extends BaseUseCase<Success, DeleteRequestModel> {
  late final PaginationRepo paginationRepo;

  DeleteItemDataUseCase(
    this.paginationRepo,
  );

  @override
  Future<Either<Failure, Success>> call(
    DeleteRequestModel deleteRequestModel,
  ) =>
      paginationRepo.deleteItemData(deleteRequestModel);
}
