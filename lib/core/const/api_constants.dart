///API timeout times
const int API_CONNECT_TIMEOUT = 30000;
const int SIGNAL_R_SOCKET_CONNECT_TIMEOUT = 30000;
const int RECEIVE_TIMEOUT = 60000;
const int SEND_TIMEOUT = 60000;

///Error code
const int LOCAL_ERROR_CODE = 0;
const int UN_AUTHORISED_ERROR_CODE = 401;

///Firebase authorization errors
const String ACCOUNT_WITH_DIFFERENT_CREDENTIAL =
    "account-exists-with-different-credential";
const String INVALID_CREDENTIAL = "invalid-credential";
const String USER_NOT_FOUND = "user-not-found";

///String exception
const String SOCKET_EXCEPTION = "SocketException";

///Header key and values
const String CONTENT_TYPE = "content-Type";
const String APPLICATION_JSON_CONTENT_TYPE = 'application/json';
const String X_API_KEY = "x-api-key";
const String X_SESSION_TOKEN = "X-Session-Token";

///Splash screen
const String GET_MOBILE_CONFIG = "ForceUpdate/getMobileAppConfiguration";
const String GENERATE_PUBLIC_TOKEN = "Login/generatepublictoken";
