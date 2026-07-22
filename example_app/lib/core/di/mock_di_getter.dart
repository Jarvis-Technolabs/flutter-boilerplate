import 'package:example_app/core/di/di_getter.dart';
import 'package:example_app/core/di/injection_container.dart';
import 'package:example_app/features/firebase_phone_auth/domain/repositories/phone_auth_repo.dart';
import 'package:example_app/features/get_api/domain/repositories/user_api_repo.dart';
import 'package:example_app/features/pagination_with_delete/domain/repositories/pagination_repo.dart';
import 'package:example_app/features/social_login/domain/repositories/social_login_repo.dart';
import 'package:example_app/features/splash/data/repository/mock_splash_repo_impl.dart';
import 'package:example_app/features/splash/domain/repositories/splash_repo.dart';
import 'package:example_app/features/accessibility/domain/repositories/accessibility_repo.dart';
import 'package:example_app/features/accessibility/data/repository/mock_accessibility_repo_impl.dart';
import 'package:example_app/core/di/injection_container.dart';

class MockDIGetter implements DIGetter {
  ///Splash screen
  @override
  SplashRepo getGetMobileConfigRepo() => MockSplashRepoImpl(sl(), sl());

  @override
  UserRepo getUserRepo() {
    // TODO: implement getUserRepo
    throw UnimplementedError();
  }

  @override
  SocialLoginRepo getSocialLoginRepo() {
    // TODO: implement getSocialLoginRepo
    throw UnimplementedError();
  }

  @override
  PhoneAuthRepo getPhoneAuthRepo() {
    // TODO: implement getPhoneAuthRepo
    throw UnimplementedError();
  }

  @override
  PaginationRepo getPaginationRepo() {
    // TODO: implement getPaginationRepo
    throw UnimplementedError();
  }

  @override
  AccessibilityRepo getAccessibilityRepo() =>
      MockAccessibilityRepoImpl(sl(), sl());
}
