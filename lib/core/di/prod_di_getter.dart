import 'package:flutter_clean_architecture/core/di/di_getter.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/features/splash/data/repository/get_splash_repo_impl.dart';
import 'package:flutter_clean_architecture/features/splash/domain/repositories/splash_repo.dart';

class ProdDIGetter implements DIGetter {
  ///Splash screen
  @override
  SplashRepo getGetMobileConfigRepo() => GetSplashRepoImpl(sl(), sl());
}
