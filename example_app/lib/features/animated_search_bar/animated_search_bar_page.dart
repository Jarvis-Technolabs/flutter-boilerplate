import 'package:example_app/core/base/base_page.dart';
import 'package:example_app/features/animated_search_bar/screen/animated_search_bar_screen.dart';
import 'package:flutter/material.dart';

class AnimatedSearchBarPage extends BasePage {
  AnimatedSearchBarPage({Key? key}) : super(key: key);

  @override
  _AnimatedSearchBarPageState createState() => _AnimatedSearchBarPageState();
}

class _AnimatedSearchBarPageState extends BasePageState<AnimatedSearchBarPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => AnimatedSearchBarScreen();
}
