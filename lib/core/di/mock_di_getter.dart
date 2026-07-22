import 'package:flutter_clean_architecture/core/di/di_getter.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/features/create_an_account/data/repository/mock_create_an_account_repo_impl.dart';
import 'package:flutter_clean_architecture/features/create_an_account/domain/repositories/create_an_account_repo.dart';
import 'package:flutter_clean_architecture/features/dashboard/data/repository/mock_dashboard_repo_impl.dart';
import 'package:flutter_clean_architecture/features/dashboard/domain/repositories/dashboard_repo.dart';
import 'package:flutter_clean_architecture/features/delete_account/data/repository/mock_delete_account_repo_impl.dart';
import 'package:flutter_clean_architecture/features/delete_account/domain/repositories/delete_account_repo.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/repository/mock_forgot_password_repo_impl.dart';
import 'package:flutter_clean_architecture/features/forgot_password/domain/repositories/forgot_password_repo.dart';
import 'package:flutter_clean_architecture/features/login/data/repository/mock_login_repo_impl.dart';
import 'package:flutter_clean_architecture/features/login/domain/repositories/login_repo.dart';
import 'package:flutter_clean_architecture/features/logout/data/repository/mock_logout_repo_impl.dart';
import 'package:flutter_clean_architecture/features/logout/domain/repositories/logout_repo.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/repository/mock_otp_verification_repo_impl.dart';
import 'package:flutter_clean_architecture/features/otp_verification/domain/repositories/otp_verification_repo.dart';
import 'package:flutter_clean_architecture/features/reset_password/data/repository/mock_reset_password_repo_impl.dart';
import 'package:flutter_clean_architecture/features/reset_password/domain/repositories/reset_password_repo.dart';
import 'package:flutter_clean_architecture/features/settings/data/repository/mock_setting_repo_impl.dart';
import 'package:flutter_clean_architecture/features/settings/domain/repositories/setting_repo.dart';
import 'package:flutter_clean_architecture/features/splash/data/repository/mock_splash_repo_impl.dart';
import 'package:flutter_clean_architecture/features/splash/domain/repositories/splash_repo.dart';
import 'package:flutter_clean_architecture/features/notification/domain/repositories/notification_repo.dart';
import 'package:flutter_clean_architecture/features/notification/data/repository/mock_notification_repo_impl.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/features/home/domain/repositories/home_repo.dart';
import 'package:flutter_clean_architecture/features/home/data/repository/mock_home_repo_impl.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';

class MockDIGetter implements DIGetter {
  ///Splash screen
  @override
  SplashRepo getGetMobileConfigRepo() => MockSplashRepoImpl(sl(), sl());

  @override
  LoginRepo getLoginRepo() => MockLoginRepoImpl(sl(), sl());

  @override
  CreateAnAccountRepo getCreateAnAccountRepo() =>
      MockCreateAnAccountRepoImpl(sl(), sl());

  @override
  ForgotPasswordRepo getForgotPasswordRepo() =>
      MockForgotPasswordRepoImpl(sl(), sl());

  @override
  OtpVerificationRepo getOtpVerificationRepo() =>
      MockOtpVerificationRepoImpl(sl(), sl());

  @override
  ResetPasswordRepo getResetPasswordRepo() =>
      MockResetPasswordRepoImpl(sl(), sl());

  @override
  DashboardRepo getDashboardRepo() => MockDashboardRepoImpl(sl(), sl());

  @override
  SettingRepo getSettingRepo() => MockSettingRepoImpl(sl(), sl());

  @override
  DeleteAccountRepo getDeleteAccountRepo() =>
      MockDeleteAccountRepoImpl(sl(), sl());

  @override
  LogoutRepo getLogoutRepo() => MockLogoutRepoImpl(sl(), sl());

  @override
  NotificationRepo getNotificationRepo() =>
      MockNotificationRepoImpl(sl(), sl());

  @override
  HomeRepo getHomeRepo() => MockHomeRepoImpl(sl(), sl());
}
