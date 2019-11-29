// todo make sure that base state classes are abstract
abstract class BaseApiState {
  const BaseApiState();
}

class BaseApiStateInitial extends BaseApiState {}

class ApiErrorState extends BaseApiState {
  final String message;
  final int apiStatus;

  ApiErrorState(this.message, this.apiStatus) : super();
}
