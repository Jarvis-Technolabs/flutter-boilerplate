import 'package:example_app/core/base/base_page.dart';
import 'package:example_app/features/social_login/presentation/bloc/social_login_bloc.dart';
import 'package:example_app/features/social_login/presentation/screen/social_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/bloc/api_base_bloc/api_base_bloc.dart';
import '../../../core/di/injection_container.dart';

class SocialLoginPage extends BasePage {
  SocialLoginPage({Key? key}) : super(key: key);

  @override
  _SocialLoginPageState createState() => _SocialLoginPageState();
}

class _SocialLoginPageState extends BasePageState<SocialLoginPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider<SocialLoginBloc>(
        create: (context) => SocialLoginBloc(
          apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
          googleSignInUseCase: sl(),
          appleSignInUseCase: sl(),
        ),
        child: SocialLoginScreen(),
      );
}
