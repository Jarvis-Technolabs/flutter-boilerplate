import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_page.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';

import 'presentation/bloc/login_bloc.dart';
import 'presentation/screen/login_screen.dart';

class LoginPage extends BasePage {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider(
        create: (context) => LoginBloc(
          apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
          loginUseCase: sl(),
          generatePublicTokenUseCase: sl(),
        ),
        child: LoginScreen(),
      );
}
