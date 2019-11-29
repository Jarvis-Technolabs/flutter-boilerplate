import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/features/login/data/entities/RegistrationRequest.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  RegistrationRequest registrationRequest;

  LoginButtonPressed({@required this.registrationRequest});

  @override
  List<Object> get props => [registrationRequest];

  @override
  String toString() => 'LoginButtonPressed { username: $registrationRequest}';
}
