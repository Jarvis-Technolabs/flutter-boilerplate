import 'package:flutter_clean_architecture/core/di/di_getter.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/features/splash/data/repository/mock_splash_repo_impl.dart';
import 'package:flutter_clean_architecture/features/splash/domain/repositories/splash_repo.dart';

class MockDIGetter implements DIGetter {
  ///Splash screen
  @override
  SplashRepo getGetMobileConfigRepo() => MockSplashRepoImpl(sl(), sl());
}
