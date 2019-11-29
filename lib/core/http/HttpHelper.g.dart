// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HttpHelper.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestHelper implements RestHelper {
  _RestHelper(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  final String baseUrl = 'https://urlto/api/';

  @override
  getInstitutions() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'General/GetInstitution',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ApiResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  callLoginApi(regReq) async {
    ArgumentError.checkNotNull(regReq, 'regReq');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(regReq.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'Registration/RegistrationSubmitNew',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ApiResponse.fromJson(_result.data);
    return Future.value(value);
  }
}
