import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/api/model/failure.dart';
import 'package:flutter_clean_architecture/core/api/model/success.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc_event.dart';
import 'package:flutter_clean_architecture/core/base/bloc/base_bloc.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/sendOTP_response_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/data/model/verifyOTP_response_model.dart';
import 'package:flutter_clean_architecture/features/otp_verification/domain/usecases/sendotp_usecase.dart';
import 'package:flutter_clean_architecture/features/otp_verification/domain/usecases/verifyotp_usecase.dart';

import 'otp_verification_event.dart';
import 'otp_verification_state.dart';

class OtpVerificationBloc
    extends BaseBloc<OtpVerificationEvent, OtpVerificationState> {
  final VerifyOTPUseCase verifyOTPUseCase;
  final SendOTPUseCase sendOTPUseCase;
  OtpVerificationBloc({
    required this.sendOTPUseCase,
    required this.verifyOTPUseCase,
    required ApiBaseBloc apiBaseBloc,
  }) : super(apiBaseBloc, OtpVerificationStateInitialState()) {
    on<VerifyOtpEvent>(verifyOTPEvent);
    on<SendOtpEvent>(sendOTPEvent);
  }

  Future<void> sendOTPEvent(SendOtpEvent event, Emitter emit) async {
    apiBaseBlocObject.add(LoadApiEvent());
    await mockAPIDelay();
    Either<Failure, Success> result = await sendOTPUseCase(event.request);
    await result.fold(
      (failure) async {
        apiBaseBlocObject.add(ErrorApiEvent(failure: failure));
        emit(
          SendOtpErrorState(
            message: failure.errorMessage,
            statusCode: failure.statusCode,
          ),
        );
      },
      (data) async {
        apiBaseBlocObject.add(LoadedApiEvent());
        SendOTPResponseModel sendOTPResponseModel = data.data;
        await addDelayForDialogPopAndScreenNavigation();
        emit(
          SendOtpState(
            sendOTPResponseModel: sendOTPResponseModel,
            message: data.message ?? '',
            isResendOtp: event.request.isResendOtp ?? false,
          ),
        );
      },
    );
  }

  Future<void> verifyOTPEvent(VerifyOtpEvent event, Emitter emit) async {
    apiBaseBlocObject.add(LoadApiEvent());
    await mockAPIDelay();
    Either<Failure, Success> result = await verifyOTPUseCase(event.request);
    await result.fold(
      (failure) async {
        apiBaseBlocObject.add(ErrorApiEvent(failure: failure));
        emit(
          VerifyOtpErrorState(
            message: failure.errorMessage,
            statusCode: failure.statusCode,
          ),
        );
      },
      (data) async {
        if (!event.shouldContinueLoading) {
          apiBaseBlocObject.add(LoadedApiEvent());
        }
        VerifyOTPResponseModel verifyOTPResponseModel = data.data;
        await addDelayForDialogPopAndScreenNavigation();
        emit(
          VerifyOtpState(
            response: verifyOTPResponseModel,
            message: data.message ?? '',
          ),
        );
      },
    );
  }
}
