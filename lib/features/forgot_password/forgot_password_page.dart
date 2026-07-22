import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_page.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';

import 'presentation/bloc/forgot_password_bloc.dart';
import 'presentation/screen/forgot_password_screen.dart';

class ForgotPasswordPage extends BasePage {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends BasePageState<ForgotPasswordPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider(
        create: (context) => ForgotPasswordBloc(
          apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
          forgotPasswordUseCase: sl(),
        ),
        child: ForgotPasswordScreen(),
      );
}
