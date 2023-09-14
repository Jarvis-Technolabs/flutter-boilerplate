import '../../../../core/api/data_source/remote_ds/remote_ds.dart';
import '../../../../core/api/model/api_response.dart';
import '../../../../core/const/api_constants.dart';
import '../model/generate_public_token_request.dart';
import 'get_splash_data_source.dart';

class GetSplashDataSourceImpl extends GetSplashDataSource {
  late final IRemoteDataSource remoteDataSource;

  GetSplashDataSourceImpl({
    required this.remoteDataSource,
  });

  @override
  Future<ApiResponse> getMobileConfig() =>
      remoteDataSource.executeGet(path: GET_MOBILE_CONFIG);

  @override
  Future<ApiResponse> generatePublicToken(
          GeneratePublicTokenRequest generatePublicTokenRequest) =>
      remoteDataSource.executePost(
        path: GENERATE_PUBLIC_TOKEN,
        requestBody: generatePublicTokenRequest.toJson(),
      );
}
