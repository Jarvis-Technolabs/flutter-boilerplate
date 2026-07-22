import 'package:example_app/core/flavour/flavour_config.dart';

import '../../main.dart';

///Todo: update all the values which are required and remove parameter from FlavourConfig if not required
void main() {
  FlavourConfig(
    flavor: Flavour.STAGING,
    BASE_URL: "https://reqres.in/",
    //use this url for pagination with delete iten and pull to refresh
    // BASE_URL: "http://apisforjarvismockapi.jarvistechnolabs.com/api/",
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
