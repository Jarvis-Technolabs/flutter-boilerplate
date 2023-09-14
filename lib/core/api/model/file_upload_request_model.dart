class FileUploadRequestModel {
  String fileName;
  String filePath;
  String contentType;
  String imageFieldKey;

  FileUploadRequestModel({
    required this.fileName,
    required this.filePath,
    required this.contentType,
    required this.imageFieldKey,
  });
}

class ComputeFileUploadRequestModel {
  late final List<FileUploadRequestModel> fileRequest;
  late final String path;
  late final Map<String, String> headers;
  late final Map<String, String>? requestBody;
  late final String? baseUrl;

  ComputeFileUploadRequestModel({
    required this.fileRequest,
    required this.path,
    required this.headers,
    this.requestBody,
    required this.baseUrl,
  });
}
