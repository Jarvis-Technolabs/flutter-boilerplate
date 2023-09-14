import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_clean_architecture/core/di/prod_di_getter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../features/jail_break/jail_break_repository/jail_break_repo.dart';
import '../../features/jail_break/jail_break_repository/jail_break_repo_impl.dart';
import '../../features/splash/data/data_source/get_splash_data_source.dart';
import '../../features/splash/data/data_source/get_splash_data_source_impl.dart';
import '../../features/splash/domain/usecases/generate_public_token_usecase.dart';
import '../../features/splash/domain/usecases/get_mobile_config_usecase.dart';
import '../api/data_source/network_info/network_info.dart';
import '../api/data_source/network_info/network_info_impl.dart';
import '../api/data_source/remote_ds/remote_ds.dart';
import '../api/data_source/remote_ds/remote_ds_impl.dart';
import '../api/interceptor/api_call_log_printer_interceptor.dart';
import '../api/interceptor/dio_api_cache_interceptor.dart';
import '../app_configuration_bloc/app_configuration_bloc.dart';
import '../base/bloc/api_base_bloc/api_base_bloc.dart';
import '../base/bloc/api_base_bloc/api_base_bloc_state.dart';
import '../const/api_cache_constants.dart';
import '../database/app_db.dart';
import '../device_info/repository/device_info_data_source.dart';
import '../device_info/repository/device_info_data_source_impl.dart';
import '../encryption/encryption_repo.dart';
import '../encryption/encryption_repo_impl.dart';
import '../firebase_notification_data_source/firebase_notification_data_source.dart';
import '../firebase_notification_data_source/firebase_notification_data_source_impl.dart';
import '../loggers/app_log_filter.dart';
import '../loggers/app_log_printer.dart';
import '../loggers/log_to_file.dart';
import '../preference/preference_helper.dart';
import '../preference/preference_helper_impl.dart';
import '../util/file_path_util/file_paths.dart';
import 'di_getter.dart';
import 'mock_di_getter.dart';

///Service locator
final sl = GetIt.instance;

/// change as per requirements of mock data/prod data
final choice = Choice.MOCK_DATA;

///init
Future<void> init() async {
  /// Dependency Injector
  DIGetter getter =
      choice == Choice.MOCK_DATA ? MockDIGetter() : ProdDIGetter();

  ///Preference
  sl.registerLazySingleton<PreferenceHelper>(() => PreferenceHelperImpl());
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => FlutterSecureStorage(),
  );

  ///Logger
  sl.registerLazySingleton<Logger>(
    () => Logger(
      filter: AppLogFilter(),
      printer: AppLogPrinter(
        preferenceHelper: sl(),
        loggerFileUtil: sl(),
      ),
    ),
  );
  sl.registerLazySingleton<LoggerFileUtil>(() => LoggerFileUtil());

  ///Internet Connection checking
  sl.registerLazySingleton(() => Connectivity());

  ///Network
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///API calling repo
  sl.registerLazySingleton<IRemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));

  ///API cache
  HiveCacheStore cacheStore = HiveCacheStore(
    await FilePaths().getTemporaryFileDirectory(),
    hiveBoxName: HIVE_CACHE_BOX_NAME,
  );
  sl.registerSingleton<HiveCacheStore>(cacheStore);

  ///Dio and interceptors
  Dio dio = Dio();
  dio.interceptors.add(ApiCallLogPrinterInterceptors());
  dio.interceptors.add(DioAPICacheInterceptor(hiveCacheStore: cacheStore));
  sl.registerSingleton<Dio>(dio);

  ///API base bloc
  sl.registerSingleton<ApiBaseBloc>(ApiBaseBloc(ApiBaseBlocInitialState()));

  ///App configuration bloc
  sl.registerSingleton<AppConfigurationBloc>(AppConfigurationBloc());

  ///Jailbreak
  sl.registerLazySingleton<JailBreakRepo>(
    () => JailBreakRepoImpl(),
  );

  ///Device information
  sl.registerLazySingleton<DeviceInfoDataSource>(
    () => DeviceInfoDataSourceImpl(),
  );

  ///App database
  sl.registerLazySingleton<AppDb>(
    () => AppDb(),
  );

  ///Firebase messaging
  sl.registerLazySingleton<FirebaseMessaging>(
    () => FirebaseMessaging.instance,
  );

  ///Firebase data source
  sl.registerLazySingleton<FirebaseNotificationDataSource>(
    () => FirebaseNotificationDataSourceImpl(),
  );

  ///Encryption Repo
  sl.registerLazySingleton<EncryptionRepo>(() => EncryptionRepoImpl());

  ///=================================================================================================///

  ///Splash screen
  sl.registerLazySingleton(
      () => GeneratePublicTokenUseCase(getter.getGetMobileConfigRepo()));

  sl.registerLazySingleton(
      () => GetMobileConfigUseCase(getter.getGetMobileConfigRepo()));

  sl.registerLazySingleton<GetSplashDataSource>(
    () => GetSplashDataSourceImpl(remoteDataSource: sl()),
  );
}
