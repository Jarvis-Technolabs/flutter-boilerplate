import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/core/api/data_source/remote_ds/remote_ds_impl.dart';

import '../../model/api_response.dart';

mixin MockDataImpl {
  Future<ApiResponse> loadFromAssetData(String _path) async {
    ApiResponse apiResponse =
        ApiResponse.fromJson(jsonDecode(await rootBundle.loadString(_path)));
    commonUtilities.printFullLog(
        "\n\nPath => ${_path}\n\nResponse => ${jsonEncode(apiResponse.toJson())}");
    return apiResponse;
  }
}
