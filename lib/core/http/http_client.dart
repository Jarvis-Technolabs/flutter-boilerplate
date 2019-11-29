import 'package:flutter_clean_architecture/core/http/HttpHelper.dart';

abstract class RestClient {
  RestHelper getClientWithHeaders(Map<String, String> headers);

  RestHelper getClientWithoutHeaders();
}
