import 'package:example_app/core/base/base_page.dart';
import 'package:example_app/features/custom_progress_indicator/presentation/screen/custom_progress_indicator_screen.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicatorPage extends BasePage {
  CustomProgressIndicatorPage({Key? key}) : super(key: key);

  @override
  _CustomProgressIndicatorPageState createState() =>
      _CustomProgressIndicatorPageState();
}

class _CustomProgressIndicatorPageState
    extends BasePageState<CustomProgressIndicatorPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => CustomProgressIndicatorScreen();
}
