import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:example_app/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:example_app/core/base/bloc/api_base_bloc/api_base_bloc_event.dart';
import 'package:example_app/core/base/bloc/base_bloc.dart';
import 'package:example_app/core/const/api_constants.dart';
import 'package:example_app/core/const/string_constants.dart';
import 'package:example_app/features/firebase_phone_auth/presentation/bloc/phone_auth_event.dart';
import 'package:example_app/features/firebase_phone_auth/presentation/bloc/phone_auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/api/model/failure.dart';
import '../../../../core/api/model/success.dart';
import '../../data/model/phone_auth_request.dart';
import '../../domain/usecases/phone_auth_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';

class PhoneAuthBloc extends BaseBloc<PhoneAuthEvent, PhoneAuthState> {
  final PhoneAuthUseCase phoneAuthUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;

  PhoneAuthBloc({
    required ApiBaseBloc apiBaseBloc,
    required this.phoneAuthUseCase,
    required this.verifyOtpUseCase,
  }) : super(apiBaseBloc, PhoneAuthInitialState()) {
    on<FetchPhoneAuthOtpEvent>(getPhoneAuthOtp);
    on<GotoOTPScreenEvent>(gotoOTPScreenEvent);
    on<VerifyOtpEvent>(verifyOtpWithFirebase);
    on<FetchResendOtpEvent>(getResendOtp);
    on<ResendOTPScreenEvent>(resendOTPScreenEvent);
  }

  /// Below method is used for handle the success state of FetchPhoneAuthOtp

  Future<void> gotoOTPScreenEvent(
    GotoOTPScreenEvent event,
    Emitter emit,
  ) async {
    apiBaseBlocObject.add(LoadedApiEvent());
    await addDelayForDialogPopAndScreenNavigation();
    emit(
      PhoneAuthSuccessState(response: event.response),
    );
  }

  /// Below method is used for handle the success state of resend otp
  Future<void> resendOTPScreenEvent(
    ResendOTPScreenEvent event,
    Emitter emit,
  ) async {
    apiBaseBlocObject.add(LoadedApiEvent());
    await addDelayForDialogPopAndScreenNavigation();
    emit(
      ResendOtpSuccessState(response: event.response),
    );
  }

  /// VerifyOtpEvent event handler method
  Future<void> verifyOtpWithFirebase(
    VerifyOtpEvent event,
    Emitter emit,
  ) async {
    apiBaseBlocObject.add(LoadApiEvent());
    Either<Failure, Success> result = await verifyOtpUseCase(
      event.request,
    );

    await result.fold(
      (failure) {
        apiBaseBlocObject.add(
          ErrorApiEvent(failure: failure),
        );
      },
      (success) {
        apiBaseBlocObject.add(LoadedApiEvent());
        emit(
          VerifyOtpSuccessState(userCredential: success.data),
        );
      },
    );
  }

  /// FetchPhoneAuthOtpEvent handler metgod
  Future<void> getPhoneAuthOtp(
    FetchPhoneAuthOtpEvent event,
    Emitter<PhoneAuthState> emit,
  ) async {
    try {
      PhoneAuthRequest request = PhoneAuthRequest(
          phoneNumber: event.phoneNumber,
          listenForData: ((result) async {
            await result.fold(
              (failure) {
                apiBaseBlocObject.add(LoadedApiEvent());
                emit(PhoneAuthFailureState(
                  message: result.errorMessage,
                ));
              },
              (success) {
                apiBaseBlocObject.add(LoadedApiEvent());
                add(GotoOTPScreenEvent(
                  response: success.data,
                ));
              },
            );
          }));
      apiBaseBlocObject.add(LoadApiEvent());
      await phoneAuthUseCase.sendOTP(request);
    } on FirebaseAuthException catch (e) {
      apiBaseBlocObject.add(
        ErrorApiEvent(
          failure: ServerFailure(
              errorMessage: e.message ?? LABEL_SOMETHING_WENT_WRONG,
              statusCode: LOCAL_ERROR_CODE),
        ),
      );
    } catch (e) {
      apiBaseBlocObject.add(
        ErrorApiEvent(
          failure: ServerFailure(
              errorMessage: LABEL_SOMETHING_WENT_WRONG,
              statusCode: LOCAL_ERROR_CODE),
        ),
      );
    }
  }

  /// FetchResendOtpEvent event handler method
  Future<void> getResendOtp(
    FetchResendOtpEvent event,
    Emitter<PhoneAuthState> emit,
  ) async {
    try {
      PhoneAuthRequest request = PhoneAuthRequest(
          phoneNumber: event.phoneNumber,
          resendOtpToken: event.resendOtpToken,
          listenForData: ((result) async {
            await result.fold(
              (failure) {
                apiBaseBlocObject.add(LoadedApiEvent());
                emit(ResendOtpFailureState(
                  message: result.errorMessage,
                ));
              },
              (success) async {
                apiBaseBlocObject.add(LoadedApiEvent());
                add(
                  ResendOTPScreenEvent(response: success.data),
                );
              },
            );
          }));

      apiBaseBlocObject.add(LoadApiEvent());
      await phoneAuthUseCase.sendOTP(
        request,
      );
    } on FirebaseAuthException catch (e) {
      apiBaseBlocObject.add(
        ErrorApiEvent(
          failure: ServerFailure(
              errorMessage: e.message ?? LABEL_SOMETHING_WENT_WRONG,
              statusCode: LOCAL_ERROR_CODE),
        ),
      );
    } catch (e) {
      apiBaseBlocObject.add(
        ErrorApiEvent(
          failure: ServerFailure(
              errorMessage: LABEL_SOMETHING_WENT_WRONG,
              statusCode: LOCAL_ERROR_CODE),
        ),
      );
    }
  }
}
