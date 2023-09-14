import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';

import '../../const/api_cache_constants.dart';
import '../api_cache_manager/api_cache_manager.dart';

class DioAPICacheInterceptor extends DioCacheInterceptor {
  final HiveCacheStore hiveCacheStore;
  DateTime? maxStale;
  bool? isFutureCalled = false;

  DioAPICacheInterceptor({required this.hiveCacheStore})
      : super(options: getCacheOptions(hiveCacheStore));

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    RequestOptions options = response.requestOptions;
    bool isSuccessResponse = true;
    try {
      Map<String, dynamic> param = response.data;
      if (param.containsKey(KEY_STATUS)) isSuccessResponse = param[KEY_STATUS];
    } catch (e) {}
    if (APIS_TO_BE_CACHED.contains(options.path) && isSuccessResponse) {
      maxStale = DateTime.now().add(Duration(seconds: API_CACHE_TIMEOUT));
    }
    return super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (APIS_TO_BE_CACHED.contains(options.path)) {
      if (!isFutureCalled!) {
        isFutureCalled = true;
        Future.delayed(const Duration(minutes: API_CACHE_TIMEOUT), () {
          hiveCacheStore
              .delete(ApiCacheManager.getGeneratedHiveDataKey(options));
          isFutureCalled = false;
        });
      }
      options.extra[HIVE_CACHE_OPTIONS] = getCacheOptions(hiveCacheStore);
    } else {
      options.extra[HIVE_CACHE_OPTIONS] =
          getCacheOptions(hiveCacheStore, cachePolicy: CachePolicy.noCache);
    }
    return super.onRequest(options, handler);
  }

  static CacheOptions getCacheOptions(HiveCacheStore hiveCacheStore,
          {CachePolicy cachePolicy = CachePolicy.forceCache}) =>
      CacheOptions(
        store: hiveCacheStore,
        policy: cachePolicy,
        maxStale: Duration(seconds: API_CACHE_TIMEOUT),
        priority: CachePriority.high,
        allowPostMethod: true,
        keyBuilder: (RequestOptions options) {
          return ApiCacheManager.getGeneratedHiveDataKey(options);
        },
      );

  bool isStaled() => maxStale?.isBefore(DateTime.now()) ?? false;
}
