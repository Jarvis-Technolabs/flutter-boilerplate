import 'package:example_app/features/custom_loader/screen/custom_loader_screen.dart';
import 'package:flutter/material.dart';
import '../../core/base/base_page.dart';

class CustomLoaderPage extends BasePage {
  CustomLoaderPage({Key? key}) : super(key: key);

  @override
  _EmailMobileTextviewPageState createState() =>
      _EmailMobileTextviewPageState();
}

class _EmailMobileTextviewPageState extends BasePageState<CustomLoaderPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => CustomLoaderScreen();
}
