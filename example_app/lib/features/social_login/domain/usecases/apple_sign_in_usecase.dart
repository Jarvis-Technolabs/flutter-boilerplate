import 'package:dartz/dartz.dart';
import 'package:example_app/core/api/model/no_request.dart';
import '../../../../core/api/base_usecases/base_usecase.dart';
import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';
import '../repositories/social_login_repo.dart';

class AppleSignInUseCase extends BaseUseCase<Success, NoRequest> {
  late final SocialLoginRepo socialLoginRepo;

  AppleSignInUseCase(this.socialLoginRepo);

  @override
  Future<Either<Failure, Success>> call(NoRequest noRequestParams) =>
      socialLoginRepo.signWithApple();
}
