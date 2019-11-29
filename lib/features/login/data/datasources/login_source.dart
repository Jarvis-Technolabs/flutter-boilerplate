
import 'package:flutter_clean_architecture/features/login/data/entities/RegistrationRequest.dart';

abstract class LoginDataSource {
  Future< String>  callLogin(RegistrationRequest registrationRequest);
}
