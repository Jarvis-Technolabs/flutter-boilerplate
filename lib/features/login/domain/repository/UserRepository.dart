import 'package:dartz/dartz.dart';

import 'package:flutter_clean_architecture/features/login/data/entities/RegistrationRequest.dart';
import 'package:flutter_clean_architecture/core/models/error/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, String>> login(
      RegistrationRequest registrationRequestModel);
}
