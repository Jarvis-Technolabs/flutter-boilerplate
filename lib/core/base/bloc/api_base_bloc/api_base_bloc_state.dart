abstract class ApiBaseBlocState {
  const ApiBaseBlocState();
}

class ApiBaseBlocInitialState extends ApiBaseBlocState {}

class ApiErrorState extends ApiBaseBlocState {
  final String? message, title, actionButtonText;
  final int? apiStatusCode;

  ApiErrorState({
    required this.message,
    required this.apiStatusCode,
    this.title,
    this.actionButtonText,
  });
}

class ApiLoadingState extends ApiBaseBlocState {}

class ApiLoadedState extends ApiBaseBlocState {}
