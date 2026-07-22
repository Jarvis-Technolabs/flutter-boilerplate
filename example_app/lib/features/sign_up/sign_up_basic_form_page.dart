import 'package:example_app/core/base/bloc/api_base_bloc/api_base_bloc.dart' show ApiBaseBloc;
import 'package:example_app/core/di/injection_container.dart';
import 'package:example_app/features/sign_up/presentation/screen/sign_up_basic_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:example_app/core/base/base_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../splash/presentation/bloc/splash_bloc.dart';

class SignUpBasicFormPage extends BasePage {
  SignUpBasicFormPage({Key? key}) : super(key: key);

  @override
  _SignUpBasicFormPageState createState() => _SignUpBasicFormPageState();
}

class _SignUpBasicFormPageState extends BasePageState<SignUpBasicFormPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider(
    create: (context) => SplashBloc(
      apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
      getMobileConfigUseCase: sl(),
      generatePublicTokenUseCase: sl(),
    ),
    child: SignUpBasicFormScreen(),
  );
}
