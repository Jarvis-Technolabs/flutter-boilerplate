import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_page.dart';
import 'package:flutter_clean_architecture/core/base/bloc/api_base_bloc/api_base_bloc.dart';

import 'presentation/bloc/dashboard_bloc.dart';
import 'presentation/screen/dashboard_screen.dart';

class DashboardPage extends BasePage {
  DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends BasePageState<DashboardPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider(
        create: (context) => DashboardBloc(
          apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
        ),
        child: DashboardScreen(),
      );
}
