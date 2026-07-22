import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_page.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/features/otp_verification/presentation/bloc/otp_verification_bloc.dart';

import 'presentation/bloc/create_an_account_bloc.dart';
import 'presentation/screen/create_an_account_screen.dart';

class CreateAnAccountPage extends BasePage {
  CreateAnAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAnAccountPageState createState() => _CreateAnAccountPageState();
}

class _CreateAnAccountPageState extends BasePageState<CreateAnAccountPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CreateAnAccountBloc(
              apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
              signupUseCase: sl(),
            ),
          ),
          BlocProvider(
            create: (context) => OtpVerificationBloc(
              apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
              verifyOTPUseCase: sl(),
              sendOTPUseCase: sl(),
            ),
          )
        ],
        child: CreateAnAccountScreen(),
      );
}
