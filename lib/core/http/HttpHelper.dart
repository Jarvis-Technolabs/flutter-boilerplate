import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/features/login/data/entities/RegistrationRequest.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/models/Response.dart';

part 'HttpHelper.g.dart';

//flutter pub run build_runner build
// todo update base url here
@RestApi(baseUrl: "https://urlto/api/")
abstract class RestHelper {
  factory RestHelper(Dio dio) = _RestHelper;

  @POST("General/GetInstitution")
  Future<ApiResponse> getInstitutions();

  @POST("Registration/RegistrationSubmitNew")
  Future<ApiResponse> callLoginApi(@Body() RegistrationRequest regReq);
}
