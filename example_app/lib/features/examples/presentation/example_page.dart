import 'package:example_app/core/base/bloc/api_base_bloc/api_base_bloc.dart';
import 'package:example_app/core/di/injection_container.dart';
import 'package:example_app/features/examples/presentation/screen/example_screen.dart';
import 'package:flutter/material.dart';
import 'package:example_app/core/base/base_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../splash/presentation/bloc/splash_bloc.dart';

class ExamplePage extends BasePage {
  ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends BasePageState<ExamplePage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider(
    create: (context) => SplashBloc(
      apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
      getMobileConfigUseCase: sl(),
      generatePublicTokenUseCase: sl(),
    ),
    child: ExampleScreen(),
  );
}
