import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_page.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';

import 'presentation/bloc/home_bloc.dart';
import 'presentation/screen/home_screen.dart';

class HomePage extends BasePage {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider(
        create: (context) => HomeBloc(
          apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
        ),
        child: HomeScreen(),
      );
}
