import 'package:example_app/core/base/base_page.dart';
import 'package:example_app/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:example_app/features/get_api/presentation/bloc/user_bloc.dart';
import 'package:example_app/features/get_api/presentation/screen/get_api_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection_container.dart';

class GetApiPage extends BasePage {
  GetApiPage({Key? key}) : super(key: key);

  @override
  _GetApiPageState createState() => _GetApiPageState();
}

class _GetApiPageState extends BasePageState<GetApiPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider<UserBloc>(
        create: (context) => UserBloc(
            apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
            userApiUseCase: sl()),
        child: GetApiScreen(),
      );
}
