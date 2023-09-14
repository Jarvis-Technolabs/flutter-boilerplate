///ScreenUtil size
//Todo: Please update the UI design size when starting a project
///UI design size should be same as the size of screen provided by designer
const double UI_DESIGN_WIDTH = 375.0;
const double UI_DESIGN_HEIGHT = 812.0;
const int TABLET_DEVICE_WIDTH = 768;

///Fonts
///Todo: add all font family
const String MULISH_REGULAR_FONT_FAMILY = 'Mulish';

///Logs
///Todo: Update log file name
const bool ENABLE_STORING_LOGS_TO_FILE = false;
const String LOG_FILE_NAME = "AppNameLogs.txt";

///Stores
///Todo: Update store IDs
const String APP_STORE_ID = "";
const String PLAY_STORE_ID = "";

///Notification
///Todo: Update the below values for notification
const String NOTIFICATION_GROUP_KEY = 'com.xyz.app';
const String NOTIFICATION_GROUP_CHANNEL_ID = 'xyzNotification';
const String NOTIFICATION_GROUP_CHANNEL_NAME = 'xyz Channel';
const String NOTIFICATION_GROUP_CHANNEL_DESCRIPTION = 'Xyz Notification';
const String NOTIFICATION_GENERAL_TOPIC = 'General';

///App Theme
const bool USE_MATERIAL_3 = true;

///Enable device preview to view app in multiple devices
const bool ENABLE_DEVICE_PREVIEW = false;

///Files
const String PDF = "pdf";
const String PDF_EXTENSION = ".pdf";
const String IMAGE_EXTENSION = ".jpg";
const String XLS_EXTENSION = ".xlsx";
const String ANDROID_DOWNLOAD_PATH = "storage/emulated/0/Download/";
const double ALLOW_PDF_FILE_SIZE_IN_MB = 10;
const double ALLOW_IMAGE_FILE_SIZE_IN_MB = 3;

///Text fields
const int CHAR_LIMIT_200 = 200;
const int CHAR_LIMIT_50 = 50;
const int CHAR_LIMIT_30 = 30;
const int CHAR_LIMIT_20 = 20;
const int PHONE_NUMBER_LIMIT = 20;
const MINIMUM_MOBILE_NUMBER_LENGTH = 12;
const String REGEX_NUMBER = r"[0-9]";
const String REGEX_ALPHANUMERIC = r"[a-zA-Z0-9]";
const String REGEX_ALPHANUMERIC_WITH_SPACE = '[a-z A-Z0-9]';
const String REGEX_ONLY_CHARACTERS = '[a-zA-Z]';
const String REGEX_ONLY_CHARACTERS_WITH_SPACE = '[a-z A-Z]';
const String REGEX_RESTRICT_ZERO_AT_FIRST_POSITION = r'^0+';
const String REGEX_DOUBLE = r'(^\d*\.?\d*)';
const String REGEX_TO_RESTRICT_EMOJI =
    r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';
const String REGEX_TO_RESTRICT_FIRST_CHAR_COMMA = r'^,+';
const String WEBSITE_VALID_FORMAT_REGEX =
    r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?";

///Mobile number
const String REGEX_ALLOWED_PHONE_NUMBER_CHAR = '[0-9+]';
const String PHONE_NUMBER_VALID_FORMAT_REGEX = r"^\+1\d*$";

///Email
const String ALLOWED_EMAIL_REGEX = r"[a-zA-Z0-9@._#\/\-$%^&*+`,~!?']";
const String EMAIL_VALID_FORMAT_REGEX =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

///Password
const String OBSCURE_CHARACTER = "*";
const int PASSWORD_LIMIT = 32;
const String ALLOWED_PASSWORD_REGEX =
    r"""[a-zA-Z0-9@._#\/\-$%^&*+`,~!?'():;<>=ˆ˜{}|\\\[\]"]""";
const String VALID_PASSWORD_REGEX =
    "^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!\-/@#\$%^&*(),.?:{}|<>]).*";

///Dates
const String API_DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ssZ";
final String CURRENT_TIME_STAMP =
    DateTime.parse(DateTime.now().toString()).toString().replaceAll(":", "_");
final DateTime ALLOWED_PREVIOUS_DAYS = DateTime(DateTime.now().year - 50);
final DateTime ALLOWED_FUTURE_DAYS = DateTime(DateTime.now().year + 50);

///Default app launcher
const String TELEPHONE_URL = "tel:";
const String MAIL_URL = "mailto:";

///MAP URLs
const String APPLE_MAP_URL = "https://maps.apple.com/?daddr=";
const String APPLE_MAP_APP_URL = "comgooglemaps://?q=";
const String APPLE_MAP_APP = "comgooglemaps:";
const String LAUNCH_MAP_URL =
    "https://www.google.com/maps/search/?api=1&query=";
const String CHANNEL_OPEN_APP = "flutter.native/openApp";
