import '../../../../core/api/model/api_response.dart';
import '../model/generate_public_token_request.dart';

abstract class GetSplashDataSource {
  Future<ApiResponse> getMobileConfig();

  Future<ApiResponse> generatePublicToken(
    GeneratePublicTokenRequest generatePublicTokenRequest,
  );
}
