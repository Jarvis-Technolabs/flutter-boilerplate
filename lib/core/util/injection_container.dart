import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/http/http_client.dart';
import 'package:flutter_clean_architecture/core/http/http_client_impl.dart';
import 'package:flutter_clean_architecture/core/http/network_info.dart';
import 'package:flutter_clean_architecture/core/http/network_info_impl.dart';
import 'package:flutter_clean_architecture/core/loggers/AppLogFilter.dart';
import 'package:flutter_clean_architecture/core/loggers/AppLogPrinter.dart';
import 'package:flutter_clean_architecture/core/preference/PrefHelper.dart';
import 'package:flutter_clean_architecture/core/preference/PrefHelperImpl.dart';
import 'package:flutter_clean_architecture/features/feed/data/database/DbInstitutionsRepo.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_local_data_source.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_local_data_source_impl.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_remote_data_source_impl.dart';
import 'package:flutter_clean_architecture/features/feed/data/repositories/feeds_repository_impl.dart';
import 'package:flutter_clean_architecture/features/feed/domain/repositories/feeds_repository.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_clean_architecture/features/login/data/datasources/login_source.dart';
import 'package:flutter_clean_architecture/features/login/data/datasources/login_source_iml.dart';
import 'package:flutter_clean_architecture/features/login/data/repository/UserRepositoryIml.dart';
import 'package:flutter_clean_architecture/features/login/domain/repository/UserRepository.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

//
// for dependency injection
//
final sl = GetIt.instance;

Future<void> init() async {
  // Repository
  sl.registerLazySingleton<FeedsRepository>(
    () => FeedsRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerSingleton<AuthenticationBloc>(AuthenticationBloc());
  // logger
  sl.registerLazySingleton<Logger>(
    () => Logger(
      filter: AppLogFilter(),
      printer: AppLogPrinter(),
    ),
  );

  sl.registerSingleton<Dio>(Dio());

  // Data sources
  sl.registerLazySingleton<LoginDataSource>(
    () => LoginSourceIml(restClient: sl()),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryIml(networkInfo: sl(), remoteLoginSource: sl()),
  );

  sl.registerLazySingleton<FeedRemoteDataSource>(
    () => FeedRemoteDataSourceImpl(restClient: sl()),
  );

//  sl.registerLazySingleton<KeyValueStore>(
//      () => KeyValueStoreImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //Preference Helper

  sl.registerLazySingleton<PrefHelper>(() => PrefHelperImpl());

  // restClient Injection
  sl.registerLazySingleton<RestClient>(() => RestClientImpl(dioClient: sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());

  // database table injection
//  InstitutionRepo
  sl.registerSingleton<InstitutionRepo>(InstitutionRepo());

//  LocalDataSourceRepo
  sl.registerLazySingleton<FeedLocalDataSource>(
      () => FeedLocalDataSourceImpl());
}
