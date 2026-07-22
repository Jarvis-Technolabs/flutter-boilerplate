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
const String ACCEPT = "Accept";
const String APPLICATION_JSON_CONTENT_TYPE = 'application/json';
const String X_API_KEY = "x-api-key";
const String X_SESSION_TOKEN = "X-Session-Token";

///Splash screen
const String GET_MOBILE_CONFIG = "ForceUpdate/getMobileAppConfiguration";
const String GENERATE_PUBLIC_TOKEN = "Login/generatepublictoken";

const String LOGIN_API = "login";
const String SIGNUP_API = "signup";
const String SEND_OTP_API = "sendOTP";
const String VERIFY_OTP_API = "verifyOTP";
const String FORGOT_PASSWORD_API = "forgotPassword";
const String RESET_PASSWORD_API = "login/resetPassword";
const String DELETE_ACCOUNT_API = "delete_account";
const String LOGOUT_API = "logout_api";
const String GET_NOTIFICATION_API = "getNotification";
