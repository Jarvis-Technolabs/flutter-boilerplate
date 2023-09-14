import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../../const/api_constants.dart';
import '../../const/string_constants.dart';
import '../data_source/mock/mock_data_impl.dart';
import '../data_source/network_info/network_info.dart';
import '../model/failure.dart';
import '../model/success.dart';

abstract class BaseApiRepo with MockDataImpl {
  final NetworkInfo networkInfo;

  BaseApiRepo({
    required this.networkInfo,
  });

  Future<Either<Failure, Success>> baseApiMethod(
    Future<Either<Failure, Success>> Function() apiCall,
  ) async {
    bool isConnected = await networkInfo.isConnected;

    if (!isConnected) {
      FirebaseCrashlytics.instance.log(
        'Internet connection Error :: Internet check error',
      );
      return InternetConnectionException();
    }
    try {
      return await apiCall();
    } on DioException catch (e) {
      String statusMessage = "";
      int statusCode = LOCAL_ERROR_CODE;
      if (e.response != null) {
        statusCode = e.response!.statusCode!;
        statusMessage = LABEL_INTERNAL_SERVER_ERROR;
        if (statusCode == UN_AUTHORISED_ERROR_CODE) {
          statusMessage = LABEL_UNAUTHORIZED_USER;
        }
      } else {
        FirebaseCrashlytics.instance.log('Dio Response is null');
        if (e.error is SocketException) {
          return timeOutException();
        }
      }
      return Left(
        ServerFailure(
          errorMessage: statusMessage,
          statusCode: statusCode,
        ),
      );
    } on TimeoutException {
      FirebaseCrashlytics.instance.log('TimeOutException');
      return Left(defaultFailure());
    } on FirebaseAuthException catch (exception) {
      return fireBaseAuthError(exception.code);
    } catch (e) {
      if (e.toString().contains('AuthorizationErrorCode.canceled')) {
        return Left(
          ServerFailure(
            errorMessage: LABEL_SOMETHING_WENT_WRONG,
            statusCode: LOCAL_ERROR_CODE,
          ),
        );
      }
      FirebaseCrashlytics.instance.log(
        'Erros from base Api repository Catch :: ' + e.toString(),
      );
      if (e.toString().contains(SOCKET_EXCEPTION)) {
        return timeOutException();
      }
      return Left(
        defaultFailure(),
      );
    } finally {}
  }

  ServerFailure defaultFailure() => ServerFailure(
        errorMessage: LABEL_SOMETHING_WENT_WRONG,
        statusCode: LOCAL_ERROR_CODE,
      );

  Left<Failure, Success> InternetConnectionException() => Left(
        ServerFailure(
          errorMessage: LABEL_INTERNET_CONNECTION,
          statusCode: LOCAL_ERROR_CODE,
        ),
      );

  Left<Failure, Success> timeOutException() => Left(
        ServerFailure(
          errorMessage: LABEL_TIMEOUT_ERROR_MESSAGE,
          statusCode: LOCAL_ERROR_CODE,
        ),
      );

  Left<Failure, Success> fireBaseAuthError(String errorCode) {
    switch (errorCode) {
      case ACCOUNT_WITH_DIFFERENT_CREDENTIAL:
        return Left(
          ServerFailure(
            errorMessage: LABEL_ACCOUNT_ALREADY_EXIST,
            statusCode: LOCAL_ERROR_CODE,
          ),
        );
      case USER_NOT_FOUND:
        return Left(
          ServerFailure(
            errorMessage: LABEL_USER_DOES_NOT_EXIST,
            statusCode: LOCAL_ERROR_CODE,
          ),
        );
      case INVALID_CREDENTIAL:
        return Left(
          ServerFailure(
            errorMessage: LABEL_CREDENTIALS_ARE_INVALID,
            statusCode: LOCAL_ERROR_CODE,
          ),
        );
      default:
        return Left(
          ServerFailure(
            errorMessage: LABEL_SOMETHING_WENT_WRONG,
            statusCode: LOCAL_ERROR_CODE,
          ),
        );
    }
  }
}
