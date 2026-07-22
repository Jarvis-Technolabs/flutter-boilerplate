import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_bloc_widget.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomeScreen extends BaseBlocWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseBlocWidgetState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget getCustomBloc() => BlocConsumer<HomeBloc, HomeState>(
        listener: (_, state) {},
        builder: (_, state) => Scaffold(
          backgroundColor: appColors.screenBgColor,
          body: Placeholder(),
        ),
      );
}
