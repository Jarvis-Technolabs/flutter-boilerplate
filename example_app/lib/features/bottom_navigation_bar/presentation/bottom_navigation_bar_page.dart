import 'package:example_app/features/bottom_navigation_bar/presentation/screen/bottom_navigation_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:example_app/core/base/base_page.dart';

class BottomNavigationBarPage extends BasePage {
  BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarPageState createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState
    extends BasePageState<BottomNavigationBarPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => BottomNavigationBarScreen();
}
