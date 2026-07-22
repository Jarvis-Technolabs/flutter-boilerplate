enum Flavour { DEV, STAGING, PROD }

class FlavourConfig {
  final Flavour flavor;
  final String? BASE_URL;
  static FlavourConfig? _instance;
  final List<int> USER_NAME,
      Password,
      AES_IV,
      AES_KEY,
      AES_TOKEN,
      X_API_KEY,
      DATABASE_PASSWORD;
  final String MAP_KEY;
  final String SSL_CERTIFICATE_PATH;
  final String TERMS_AND_CONDITION_URL;
  final String PRIVACY_POLICY_URL;
  final String WEB_SOCKET_URL;

  factory FlavourConfig({
    required Flavour flavor,
    required String? BASE_URL,
    required List<int> USER_NAME,
    required List<int> Password,
    required List<int> AES_IV,
    required List<int> AES_KEY,
    required List<int> AES_TOKEN,
    required List<int> X_API_KEY,
    required List<int> DATABASE_PASSWORD,
    required String MAP_KEY,
    required String SSL_CERTIFICATE_PATH,
    required String TERMS_AND_CONDITION_URL,
    required String PRIVACY_POLICY_URL,
    required String WEB_SOCKET_URL,
  }) {
    _instance ??= FlavourConfig._internal(
      flavor,
      BASE_URL,
      USER_NAME,
      Password,
      AES_IV,
      AES_KEY,
      AES_TOKEN,
      X_API_KEY,
      DATABASE_PASSWORD,
      MAP_KEY,
      SSL_CERTIFICATE_PATH,
      TERMS_AND_CONDITION_URL,
      PRIVACY_POLICY_URL,
      WEB_SOCKET_URL,
    );
    return _instance!;
  }

  FlavourConfig._internal(
    this.flavor,
    this.BASE_URL,
    this.USER_NAME,
    this.Password,
    this.AES_IV,
    this.AES_KEY,
    this.AES_TOKEN,
    this.X_API_KEY,
    this.DATABASE_PASSWORD,
    this.MAP_KEY,
    this.SSL_CERTIFICATE_PATH,
    this.TERMS_AND_CONDITION_URL,
    this.PRIVACY_POLICY_URL,
    this.WEB_SOCKET_URL,
  );

  static FlavourConfig? get instance => _instance;

  static bool isProd() => _instance!.flavor == Flavour.PROD;

  static bool isDev() => _instance!.flavor == Flavour.DEV;

  static bool isStaging() => _instance!.flavor == Flavour.STAGING;
}
