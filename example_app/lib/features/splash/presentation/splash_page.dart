import 'package:example_app/features/splash/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/base_page.dart';
import '../../../core/base/bloc/api_base_bloc/api_base_bloc.dart';
import '../../../core/di/injection_container.dart';
import 'bloc/splash_bloc.dart';

class SplashPage extends BasePage {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider(
    create: (context) => SplashBloc(
      apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
      getMobileConfigUseCase: sl(),
      generatePublicTokenUseCase: sl(),
    ),
    child: SplashScreen(),
  );
}
