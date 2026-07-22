import 'package:flutter_clean_architecture/core/di/di_getter.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/features/create_an_account/data/repository/create_an_account_repo_impl.dart';
import 'package:flutter_clean_architecture/features/create_an_account/domain/repositories/create_an_account_repo.dart';
import 'package:flutter_clean_architecture/features/dashboard/data/repository/dashboard_repo_impl.dart';
import 'package:flutter_clean_architecture/features/dashboard/domain/repositories/dashboard_repo.dart';
import 'package:flutter_clean_architecture/features/delete_account/data/repository/delete_account_repo_impl.dart';
import 'package:flutter_clean_architecture/features/delete_account/domain/repositories/delete_account_repo.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/repository/forgot_password_repo_impl.dart';
import 'package:flutter_clean_architecture/features/forgot_password/domain/repositories/forgot_password_repo.dart';
import 'package:flutter_clean_architecture/features/login/data/repository/login_repo_impl.dart';
import 'package:flutter_clean_architecture/features/login/domain/repositories/login_repo.dart';
import 'package:flutter_clean_architecture/features/logout/data/repository/logout_repo_impl.dart';
import 'package:flutter_clean_architecture/features/logout/domain/repositories/logout_repo.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/repository/otp_verification_repo_impl.dart';
import 'package:flutter_clean_architecture/features/otp_verification/domain/repositories/otp_verification_repo.dart';
import 'package:flutter_clean_architecture/features/reset_password/data/repository/reset_password_repo_impl.dart';
import 'package:flutter_clean_architecture/features/reset_password/domain/repositories/reset_password_repo.dart';
import 'package:flutter_clean_architecture/features/settings/data/repository/setting_repo_impl.dart';
import 'package:flutter_clean_architecture/features/settings/domain/repositories/setting_repo.dart';
import 'package:flutter_clean_architecture/features/splash/data/repository/get_splash_repo_impl.dart';
import 'package:flutter_clean_architecture/features/splash/domain/repositories/splash_repo.dart';
import 'package:flutter_clean_architecture/features/notification/data/repository/notification_repo_impl.dart';
import 'package:flutter_clean_architecture/features/notification/domain/repositories/notification_repo.dart';
import 'package:flutter_clean_architecture/features/home/data/repository/home_repo_impl.dart';
import 'package:flutter_clean_architecture/features/home/domain/repositories/home_repo.dart';

class ProdDIGetter implements DIGetter {
  ///Splash screen
  @override
  SplashRepo getGetMobileConfigRepo() => GetSplashRepoImpl(sl(), sl());

  @override
  LoginRepo getLoginRepo() => LoginRepoImpl(sl(), sl());

  @override
  CreateAnAccountRepo getCreateAnAccountRepo() =>
      CreateAnAccountRepoImpl(sl(), sl());

  @override
  ForgotPasswordRepo getForgotPasswordRepo() =>
      ForgotPasswordRepoImpl(sl(), sl());

  @override
  OtpVerificationRepo getOtpVerificationRepo() =>
      OtpVerificationRepoImpl(sl(), sl());

  @override
  ResetPasswordRepo getResetPasswordRepo() => ResetPasswordRepoImpl(sl(), sl());

  @override
  DashboardRepo getDashboardRepo() => DashboardRepoImpl(sl(), sl());

  @override
  SettingRepo getSettingRepo() => SettingRepoImpl(sl(), sl());

  @override
  DeleteAccountRepo getDeleteAccountRepo() => DeleteAccountRepoImpl(sl(), sl());

  @override
  LogoutRepo getLogoutRepo() => LogoutRepoImpl(sl(), sl());

  @override
  NotificationRepo getNotificationRepo() => NotificationRepoImpl(sl(), sl());

  @override
  HomeRepo getHomeRepo() => HomeRepoImpl(sl(), sl());
}
