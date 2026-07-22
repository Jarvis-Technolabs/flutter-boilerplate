import 'package:example_app/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:example_app/features/firebase_phone_auth/presentation/bloc/phone_auth_bloc.dart';
import 'package:example_app/features/firebase_phone_auth/presentation/screen/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:example_app/core/base/base_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';

class VerifyOtpPage extends BasePage {
  final String verificationID;

  final String phoneNo;

  final int? resendOtpToken;

  VerifyOtpPage(
      {Key? key,
      required this.verificationID,
      required this.phoneNo,
      this.resendOtpToken})
      : super(key: key);

  @override
  _FirebasePhoneAuthPageState createState() => _FirebasePhoneAuthPageState();
}

class _FirebasePhoneAuthPageState extends BasePageState<VerifyOtpPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider<PhoneAuthBloc>(
        create: (context) => PhoneAuthBloc(
          apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
          phoneAuthUseCase: sl(),
          verifyOtpUseCase: sl(),
        ),
        child: VerifyOtpScreen(
          verificationID: widget.verificationID,
          phoneNo: widget.phoneNo,
          resendOtpToken: widget.resendOtpToken,
        ),
      );
}
