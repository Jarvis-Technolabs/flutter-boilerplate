import 'package:example_app/core/di/di_getter.dart';
import 'package:example_app/core/di/injection_container.dart';
import 'package:example_app/features/firebase_phone_auth/domain/repositories/phone_auth_repo.dart';
import 'package:example_app/features/get_api/domain/repositories/user_api_repo.dart';
import 'package:example_app/features/pagination_with_delete/data/repository/pagination_repo_impl.dart';
import 'package:example_app/features/pagination_with_delete/domain/repositories/pagination_repo.dart';
import 'package:example_app/features/social_login/domain/repositories/social_login_repo.dart';
import 'package:example_app/features/splash/data/repository/get_splash_repo_impl.dart';
import 'package:example_app/features/splash/domain/repositories/splash_repo.dart';
import '../../features/firebase_phone_auth/data/repository/phone_auth_repo_impl.dart';
import '../../features/get_api/data/repository/user_repo_impl.dart';
import '../../features/social_login/data/repository/social_login_repo_impl.dart';
import 'package:example_app/features/accessibility/data/repository/accessibility_repo_impl.dart';
import 'package:example_app/features/accessibility/domain/repositories/accessibility_repo.dart';

class ProdDIGetter implements DIGetter {
  ///Splash screen
  @override
  SplashRepo getGetMobileConfigRepo() => GetSplashRepoImpl(sl(), sl());

  @override
  UserRepo getUserRepo() => UserRepoImpl(sl(), sl());

  @override
  SocialLoginRepo getSocialLoginRepo() => SocialLoginRepoImpl(sl(), sl());

  @override
  PhoneAuthRepo getPhoneAuthRepo() => PhoneAuthRepoImpl(sl());

  @override
  PaginationRepo getPaginationRepo() => PaginationRepoImpl(sl(), sl());

  @override
  AccessibilityRepo getAccessibilityRepo() => AccessibilityRepoImpl(sl(), sl());
}
