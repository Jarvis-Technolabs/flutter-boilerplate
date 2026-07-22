import 'package:example_app/core/base/base_page.dart';
import 'package:example_app/features/app_language/presentation/screen/change_language_screen.dart';
import 'package:flutter/material.dart';

class ChangeLanguagePage extends BasePage {
  ChangeLanguagePage({Key? key}) : super(key: key);

  @override
  _ChangeLanguagePageState createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends BasePageState<ChangeLanguagePage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => ChangeLanguageScreen();
}
