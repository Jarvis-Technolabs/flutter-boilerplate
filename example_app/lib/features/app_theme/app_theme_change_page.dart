import 'package:example_app/features/app_theme/presentation/screen/app_theme_change_screen.dart';
import 'package:flutter/material.dart';
import 'package:example_app/core/base/base_page.dart';

class AppThemeChangePage extends BasePage {
  AppThemeChangePage({Key? key}) : super(key: key);

  @override
  _AppThemeChangePageState createState() => _AppThemeChangePageState();
}

class _AppThemeChangePageState extends BasePageState<AppThemeChangePage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => AppThemeChangeScreen();
}
