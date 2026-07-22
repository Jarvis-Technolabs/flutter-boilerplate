import 'package:flutter_clean_architecture/features/create_an_account/domain/repositories/create_an_account_repo.dart';
import 'package:flutter_clean_architecture/features/dashboard/domain/repositories/dashboard_repo.dart';
import 'package:flutter_clean_architecture/features/delete_account/domain/repositories/delete_account_repo.dart';
import 'package:flutter_clean_architecture/features/forgot_password/domain/repositories/forgot_password_repo.dart';
import 'package:flutter_clean_architecture/features/login/domain/repositories/login_repo.dart';
import 'package:flutter_clean_architecture/features/logout/domain/repositories/logout_repo.dart';
import 'package:flutter_clean_architecture/features/otp_verification/domain/repositories/otp_verification_repo.dart';
import 'package:flutter_clean_architecture/features/reset_password/domain/repositories/reset_password_repo.dart';
import 'package:flutter_clean_architecture/features/settings/domain/repositories/setting_repo.dart';
import 'package:flutter_clean_architecture/features/splash/domain/repositories/splash_repo.dart';
import 'package:flutter_clean_architecture/features/notification/domain/repositories/notification_repo.dart';
import 'package:flutter_clean_architecture/features/home/domain/repositories/home_repo.dart';

enum Choice { MOCK_DATA, PROD_DATA }

abstract class DIGetter {
  ///Splash screen
  SplashRepo getGetMobileConfigRepo();

  LoginRepo getLoginRepo();

  CreateAnAccountRepo getCreateAnAccountRepo();

  ForgotPasswordRepo getForgotPasswordRepo();

  OtpVerificationRepo getOtpVerificationRepo();

  ResetPasswordRepo getResetPasswordRepo();

  DashboardRepo getDashboardRepo();

  SettingRepo getSettingRepo();

  DeleteAccountRepo getDeleteAccountRepo();

  LogoutRepo getLogoutRepo();

  NotificationRepo getNotificationRepo();

  HomeRepo getHomeRepo();
}
