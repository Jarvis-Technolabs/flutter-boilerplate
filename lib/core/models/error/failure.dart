class Failure {
  Failure({this.message, this.apiStatus});

  final String message;
  final int apiStatus;
}

class InternetConnection extends Failure {
  InternetConnection();
}
