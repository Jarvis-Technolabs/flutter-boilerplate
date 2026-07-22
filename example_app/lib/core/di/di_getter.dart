import 'package:example_app/features/firebase_phone_auth/domain/repositories/phone_auth_repo.dart';
import 'package:example_app/features/pagination_with_delete/domain/repositories/pagination_repo.dart';
import 'package:example_app/features/social_login/domain/repositories/social_login_repo.dart';
import 'package:example_app/features/splash/domain/repositories/splash_repo.dart';
import 'package:example_app/features/accessibility/domain/repositories/accessibility_repo.dart';

import '../../features/get_api/domain/repositories/user_api_repo.dart';

enum Choice { MOCK_DATA, PROD_DATA }

abstract class DIGetter {
  ///Splash screen
  SplashRepo getGetMobileConfigRepo();

  UserRepo getUserRepo();

  SocialLoginRepo getSocialLoginRepo();

  PhoneAuthRepo getPhoneAuthRepo();

  PaginationRepo getPaginationRepo();

  AccessibilityRepo getAccessibilityRepo();
}
