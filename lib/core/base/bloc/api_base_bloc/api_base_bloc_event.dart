import '../../../api/model/failure.dart';

abstract class ApiBaseBlocEvents {}

class LoadApiEvent extends ApiBaseBlocEvents {}

class ErrorApiEvent extends ApiBaseBlocEvents {
  final Failure failure;

  ErrorApiEvent({
    required this.failure,
  });
}

class LoadedApiEvent extends ApiBaseBlocEvents {}
