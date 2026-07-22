import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_page.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/features/delete_account/presentation/bloc/delete_account_bloc.dart';
import 'package:flutter_clean_architecture/features/logout/presentation/bloc/logout_bloc.dart';

import 'presentation/bloc/setting_bloc.dart';
import 'presentation/screen/setting_screen.dart';

class SettingPage extends BasePage {
  SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends BasePageState<SettingPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SettingBloc(
              apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
            ),
          ),
          BlocProvider(
            create: (context) => DeleteAccountBloc(
              apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
              deleteAccountUseCase: sl(),
            ),
          ),
          BlocProvider(
            create: (context) => LogoutBloc(
              apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
              logoutUseCase: sl(),
            ),
          )
        ],
        child: SettingScreen(),
      );
}
