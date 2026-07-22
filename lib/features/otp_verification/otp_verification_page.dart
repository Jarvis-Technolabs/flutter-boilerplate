import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_page.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/enums/otp_screen_type.dart';
import 'package:flutter_clean_architecture/core/enums/otp_verification_for.dart';
import 'package:flutter_clean_architecture/features/delete_account/presentation/bloc/delete_account_bloc.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_response_model.dart';

import 'presentation/bloc/otp_verification_bloc.dart';
import 'presentation/screen/otp_verification_screen.dart';

class OtpVerificationPage extends BasePage {
  final SendOtpTo sendOtpTo;
  final SendOtpFor sendOtpFor;
  final String mobileNumber, email;
  final ForgotPasswordResponseModel? forgotPasswordResponseModel;

  OtpVerificationPage({
    Key? key,
    required this.mobileNumber,
    required this.email,
    required this.sendOtpFor,
    this.forgotPasswordResponseModel,
    this.sendOtpTo = SendOtpTo.Mobile,
  }) : super(key: key);

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends BasePageState<OtpVerificationPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => OtpVerificationBloc(
              apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
              verifyOTPUseCase: sl(),
              sendOTPUseCase: sl(),
            ),
          ),
          BlocProvider(
            create: (context) => DeleteAccountBloc(
              apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
              deleteAccountUseCase: sl(),
            ),
          ),
        ],
        child: OtpVerificationScreen(
          sendOtpTo: widget.sendOtpTo,
          sendOtpFor: widget.sendOtpFor,
          mobileNumber: widget.mobileNumber,
          email: widget.email,
          forgotPasswordResponseModel: widget.forgotPasswordResponseModel,
        ),
      );
}
