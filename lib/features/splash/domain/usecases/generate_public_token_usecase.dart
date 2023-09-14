import 'package:dartz/dartz.dart';

import '../../../../core/api/base_usecases/base_usecase.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/no_request.dart';
import '../../../../core/api/model/success.dart';
import '../repositories/splash_repo.dart';

class GeneratePublicTokenUseCase extends BaseUseCase<Success, NoRequest> {
  late final SplashRepo getMobileConfigRepo;

  GeneratePublicTokenUseCase(this.getMobileConfigRepo);

  @override
  Future<Either<Failure, Success>> call(NoRequest params) =>
      getMobileConfigRepo.generatePublicToken();
}
