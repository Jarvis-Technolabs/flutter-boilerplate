import 'package:flutter_clean_architecture/core/flavour/flavour_config.dart';

import '../../main.dart';

///Todo: update all the values which are required and remove parameter from FlavourConfig if not required
void main() {
  FlavourConfig(
    flavor: Flavour.DEV,
    BASE_URL: "",
    SSL_CERTIFICATE_PATH: "",
    MAP_KEY: "",
    TERMS_AND_CONDITION_URL: "",
    PRIVACY_POLICY_URL: "",
    WEB_SOCKET_URL: "",
    USER_NAME: [],
    Password: [],
    AES_KEY: [],
    AES_IV: [],
    AES_TOKEN: [],
    X_API_KEY: [],
    DATABASE_PASSWORD: [],
  );
  mainDelegate();
}
