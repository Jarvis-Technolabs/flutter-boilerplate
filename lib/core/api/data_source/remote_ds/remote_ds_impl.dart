import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/core/const/api_constants.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/flavour/flavour_config.dart';
import 'package:flutter_clean_architecture/core/preference/preference_helper.dart';
import 'package:flutter_clean_architecture/core/util/utilities.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../model/api_response.dart';
import '../../model/exception.dart';
import '../../model/file_upload_request_model.dart';
import 'remote_ds.dart';

const String GET_METHOD = 'GET';
const String POST_METHOD = 'POST';
const String PUT_METHOD = 'PUT';
const String PATCH_METHOD = 'PATCH';
const String DELETE_METHOD = 'DELETE';

class RemoteDataSourceImpl extends IRemoteDataSource {
  late final Dio client;

  RemoteDataSourceImpl({required this.client}) {
    setClient();
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }


  Future<void> setClient() async {

    /// TODO: Set certificate for SSL pinning
    var certificate =
        (await rootBundle.load(FlavourConfig.instance!.SSL_CERTIFICATE_PATH))
            .buffer
            .asInt8List();
    client.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        SecurityContext clientContext =
            SecurityContext(withTrustedRoots: false);
        clientContext.setTrustedCertificatesBytes(certificate);
        final HttpClient httpClient = HttpClient(context: clientContext);
        return httpClient;
      },
    );

    /// TODO: To allow without the certificates uncomment the below code otherwise remove the below code
/*    client.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        HttpClient httpClient = HttpClient();
        httpClient.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return httpClient;
      },
    ) ;*/
  }

  Future<Map<String, dynamic>> getHeader({String? token}) async {
    Map<String, dynamic> header = <String, dynamic>{};
    PreferenceHelper preferenceHelper = sl();
    if (token != null) {
      header.putIfAbsent(
        X_SESSION_TOKEN,
        () => token,
      );
    } else {
      String? publicToken;
      String? userToken = await preferenceHelper.getUserToken();
      if (userToken == null) {
        publicToken = await preferenceHelper.getPublicToken();
      }
      header.putIfAbsent(
        X_SESSION_TOKEN,
        () => userToken ?? publicToken ?? "",
      );
    }
    header.putIfAbsent(
      CONTENT_TYPE,
      () => APPLICATION_JSON_CONTENT_TYPE,
    );
    header.putIfAbsent(
      X_API_KEY,
      () => utf8.decode(FlavourConfig.instance!.X_API_KEY),
    );
    return header;
  }

  Future<ApiResponse> callAPI({
    required String path,
    required String method,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? requestBody,
    String? token,
    String? baseURL,
  }) async {
    ///Header
    final Map<String, dynamic> _header = await getHeader(token: token);

    /// Query parameters
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    if (queryParameters != null) {
      _queryParameters.addAll(queryParameters);
    }

    ///Request body
    final Map<String, dynamic> _requestBody = <String, dynamic>{};
    if (requestBody != null) {
      _requestBody.addAll(requestBody);
    }

    final response = await client.fetch(
      _setStreamType<ApiResponse>(
        Options(
          method: method,
          headers: _header,
          extra: <String, dynamic>{},
        )
            .compose(
              client.options,
              path,
              queryParameters: queryParameters,
              data: requestBody,
            )
            .copyWith(
              baseUrl: baseURL ?? getBaseUrl(),
            ),
      ),
    );
    ApiResponse responseData = ApiResponse.fromJson(response.data);
    if (responseData.status == 'error') {
      throw ServerException(
        message: responseData.message,
      );
    } else {
      return responseData;
    }
  }

  @override
  Future<ApiResponse> executeGet({
    required String path,
    String? token,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    ///Get Request
    return await callAPI(
      path: path,
      method: GET_METHOD,
      queryParameters: queryParameters,
      requestBody: requestBody,
    );
  }

  @override
  Future<ApiResponse> executePost({
    required String path,
    String? token,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    ///Post Request
    return await callAPI(
      path: path,
      method: POST_METHOD,
      queryParameters: queryParameters,
      requestBody: requestBody,
    );
  }

  @override
  Future<ApiResponse> executeMultipart({
    required String path,
    required List<FileUploadRequestModel> fileUploadRequestModelList,
    String? token,
    Map<String, String>? requestBody,
  }) async {
    try {
      ///Header
      PreferenceHelper preferenceHelper = sl();
      Map<String, String> _headers = {};

      String? publicToken;
      String? userToken = await preferenceHelper.getUserToken();
      if (userToken == null) {
        publicToken = await preferenceHelper.getPublicToken();
      }

      _headers.putIfAbsent(
        "x-api-key",
        () => utf8.decode(FlavourConfig.instance!.X_API_KEY),
      );
      _headers.putIfAbsent(
        "X-Session-Token",
        () => userToken ?? publicToken ?? "",
      );

      /// Request log
      Utilities.printFullLog(
          "\n\nAPI: ${path} => HEADER[${jsonEncode(_headers)}] => REQUEST_BODY[${'POST[Multipart request]'}]: ${jsonEncode(requestBody)}\n\n");

      ///Multipart request
      ApiResponse apiResponse = await compute(
        uploadMultiImages,
        ComputeFileUploadRequestModel(
          fileRequest: fileUploadRequestModelList,
          path: path,
          headers: _headers,
          requestBody: requestBody,
          baseUrl: getBaseUrl(),
        ),
      );

      /// Response log
      Utilities.printFullLog(
          "\n\nAPI: ${path} => RESPONSE[${apiResponse.statusCode}] => RESPONSE_BODY: ${apiResponse.toString()}\n\n");

      return apiResponse;
    } catch (e) {
      ///Error log
      Utilities.printFullLog('errorLogs' + e.toString());
      throw e;
    }
  }

  @override
  Future<ApiResponse> executePut({
    required String path,
    String? token,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    ///Put Request
    return await callAPI(
      path: path,
      method: PUT_METHOD,
      queryParameters: queryParameters,
      requestBody: requestBody,
    );
  }

  @override
  Future<ApiResponse> executePatch({
    required String path,
    String? token,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    ///Patch Request
    return await callAPI(
      path: path,
      method: PATCH_METHOD,
      queryParameters: queryParameters,
      requestBody: requestBody,
    );
  }

  @override
  Future<ApiResponse> executeDelete({
    required String path,
    String? token,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    ///Delete Request
    return await callAPI(
      path: path,
      method: DELETE_METHOD,
      queryParameters: queryParameters,
      requestBody: requestBody,
    );
  }
}

String getBaseUrl() => FlavourConfig.instance!.BASE_URL!;

MediaType? getContentType(String contentType) {
  List<String> contentTypeList = contentType.split('/');
  MediaType? mediaType = (contentTypeList.length == 2
      ? MediaType(contentTypeList[0], contentTypeList[1])
      : null);
  return mediaType;
}

Future<ApiResponse> uploadMultiImages(
    ComputeFileUploadRequestModel multiImageUploadSetting) async {
  try {
    ///Create request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
        multiImageUploadSetting.baseUrl! + multiImageUploadSetting.path,
      ),
    );

    ///Set header in request
    request.headers.addAll(multiImageUploadSetting.headers);

    ///Set fields in request
    request.fields.addAll(multiImageUploadSetting.requestBody??{});

    ///Set files in request
    multiImageUploadSetting.fileRequest.forEach(
      (element) async {
        request.files.add(
          await http.MultipartFile.fromPath(
            element.imageFieldKey,
            element.filePath,
            filename: element.fileName,
            contentType: getContentType(element.contentType),
          ),
        );
      },
    );

    ///Send request
    var response = await request.send();

    if (response.statusCode == 200) {
      ApiResponse responseData = ApiResponse.fromJson(
          json.decode(await response.stream.bytesToString()));

      if (responseData.status == 'error') {
        throw ServerException(
          message: responseData.message,
        );
      } else {
        return responseData;
      }
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase.toString(),
      );
    }
  } catch (e) {
    throw e;
  }
}
