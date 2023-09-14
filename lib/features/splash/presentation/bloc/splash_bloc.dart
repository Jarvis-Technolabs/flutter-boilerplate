import 'dart:async';
import 'dart:io';

import 'package:bloc/src/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_event.dart';
import 'package:flutter_clean_architecture/core/base/bloc/base_bloc.dart';
import 'package:flutter_clean_architecture/core/const/api_constants.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/preference/preference_helper.dart';
import 'package:flutter_clean_architecture/features/splash/data/model/get_mobile_config_response.dart';
import 'package:flutter_clean_architecture/features/splash/domain/usecases/generate_public_token_usecase.dart';
import 'package:flutter_clean_architecture/features/splash/domain/usecases/get_mobile_config_usecase.dart';
import 'package:flutter_clean_architecture/features/splash/presentation/bloc/splash_event.dart';
import 'package:flutter_clean_architecture/features/splash/presentation/bloc/splash_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/no_request.dart';
import '../../../../core/api/model/success.dart';

class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  final GetMobileConfigUseCase getMobileConfigUseCase;
  final GeneratePublicTokenUseCase generatePublicTokenUseCase;
  final PreferenceHelper preferenceHelper = sl();

  SplashBloc({
    required ApiBaseBloc apiBaseBloc,
    required this.getMobileConfigUseCase,
    required this.generatePublicTokenUseCase,
  }) : super(apiBaseBloc, SplashInitialEvent()) {
    on<PublicTokenEvent>(_publicTokenEvent);
    on<FetchGetMobileConfigEventDataEvent>(_FetchGetMobileConfigEventDataEvent);
  }

  Future<void> _publicTokenEvent(
      PublicTokenEvent event, Emitter<SplashState> emit) async {
    Either<Failure, Success> result =
        await generatePublicTokenUseCase(NoRequest());
    await result.fold(
      (failure){
        emit(GeneratePublicTokenErrorState(message: failure.errorMessage));
      },
      (data){
        add(FetchGetMobileConfigEventDataEvent());
      },
    );
  }

  Future<void> _FetchGetMobileConfigEventDataEvent(
      FetchGetMobileConfigEventDataEvent event,
      Emitter<SplashState> emit) async {
    Either<Failure, Success> result = await getMobileConfigUseCase(NoRequest());
    final buildNumber = int.tryParse(await getAppVersion());
    await result.fold(
      (failure) async {
        bool isUnAuthorised = failure.statusCode == UN_AUTHORISED_ERROR_CODE;
        if (isUnAuthorised) {
          if (!preferenceHelper.getIsUserLoggedIn()) {
            await preferenceHelper.clearAllPrefData();
            add(PublicTokenEvent());
          } else {
            apiBaseBlocObject.add(
              ErrorApiEvent(
                failure: failure,
              ),
            );
          }
        } else {
          emit(GetMobileConfigFetchedState());
        }
      },
      (data){
        GetMobileAPPConfigurationResponse getMobileAPPConfigurationResponse =
            data.data;
        if (buildNumber != null) {
          if (Platform.isAndroid) {
            if (getMobileAPPConfigurationResponse.minimumAndroidVersion! >
                buildNumber) {
              emit(GetMobileConfigFetchedState(isAllowed: false));
            } else {
              emit(GetMobileConfigFetchedState());
            }
          } else if (Platform.isIOS) {
            if (getMobileAPPConfigurationResponse.minimumIOSVersion! >
                buildNumber) {
              emit(GetMobileConfigFetchedState(isAllowed: false));
            } else {
              emit(GetMobileConfigFetchedState());
            }
          }
        }
      },
    );
  }

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }
}
