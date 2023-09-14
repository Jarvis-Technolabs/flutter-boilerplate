import 'package:flutter_clean_architecture/features/splash/domain/repositories/splash_repo.dart';

enum Choice { MOCK_DATA, PROD_DATA }

abstract class DIGetter {
  ///Splash screen
  SplashRepo getGetMobileConfigRepo();
}
