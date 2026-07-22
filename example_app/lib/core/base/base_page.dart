import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/api_base_bloc/api_base_bloc.dart';
import 'bloc/api_base_bloc/api_base_bloc_state.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<T extends BasePage> extends State<T> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext _context) => BlocProvider(
        create: (BuildContext __) => ApiBaseBloc(ApiBaseBlocInitialState()),
        child: getChildBlocWidget(context),
      );

  Widget getChildBlocWidget(BuildContext context);
}
