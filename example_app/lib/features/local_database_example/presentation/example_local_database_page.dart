import 'package:example_app/core/base/base_page.dart';
import 'package:example_app/features/local_database_example/presentation/screen/example_local_database_screen.dart';
import 'package:flutter/material.dart';

class ExampleLocalDataBasePage extends BasePage {
  ExampleLocalDataBasePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends BasePageState<ExampleLocalDataBasePage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => ExampleLocalDataBaseScreen();
}
