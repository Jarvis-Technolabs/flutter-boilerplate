import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example_app/core/base/base_page.dart';
import 'package:example_app/core/base/bloc/api_base_bloc/api_base_bloc.dart';

import 'presentation/bloc/accessibility_bloc.dart';
import 'presentation/screen/accessibility_screen.dart';

class AccessibilityPage extends BasePage {
  AccessibilityPage({Key? key}) : super(key: key);

  @override
  _AccessibilityPageState createState() => _AccessibilityPageState();
}

class _AccessibilityPageState extends BasePageState<AccessibilityPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BlocProvider(
        create: (context) => AccessibilityBloc(
          apiBaseBloc: BlocProvider.of<ApiBaseBloc>(context),
        ),
        child: AccessibilityScreen(),
      );
}
