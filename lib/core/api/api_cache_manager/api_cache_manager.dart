import 'package:dio/dio.dart';

import '../../const/api_cache_constants.dart';

class ApiCacheManager {
  static String getGeneratedHiveDataKey(RequestOptions options) {
    String key = options.method + "_" + options.path;
    try {
      if (options.data != null) {
        Map<String, dynamic> param = options.data;
        if (param.containsKey(HIVE_CACHE_REQUEST_PARAM)) {
          String value = param[HIVE_CACHE_REQUEST_PARAM].toString();
          if (value.isNotEmpty) {
            key += "_" + value;
          }
        }
      }
    } catch (e) {}
    return key;
  }
}
