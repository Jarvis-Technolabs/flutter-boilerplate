import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/models/Success.dart';
import 'package:flutter_clean_architecture/core/models/error/failure.dart';

abstract class BaseApiRepo {
  Future<Either<Failure, Success>> getApiStatus();
}
