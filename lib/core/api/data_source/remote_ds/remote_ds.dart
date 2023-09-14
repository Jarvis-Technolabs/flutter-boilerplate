import '../../model/api_response.dart';
import '../../model/file_upload_request_model.dart';

abstract class IRemoteDataSource {
  Future<ApiResponse> executeGet({
    required String path,
    String? token,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParameters,
  });

  Future<ApiResponse> executePost({
    required String path,
    String? token,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParameters,

  });

  Future<ApiResponse> executeMultipart({
    required String path,
    required List<FileUploadRequestModel> fileUploadRequestModelList,
    String? token,
    Map<String, String> requestBody,
  });

  Future<ApiResponse> executePut({
    required String path,
    String? token,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParameters,
  });

  Future<ApiResponse> executePatch({
    required String path,
    String? token,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParameters,
  });

  Future<ApiResponse> executeDelete({
    required String path,
    String? token,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParameters,
  });
}
