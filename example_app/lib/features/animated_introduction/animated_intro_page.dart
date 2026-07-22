import 'package:example_app/features/animated_introduction/screen/animated_intro_screen.dart';
import 'package:flutter/material.dart';

import '../../core/base/base_page.dart';

class AnimatedIntroPage extends BasePage {
  AnimatedIntroPage({Key? key}) : super(key: key);

  @override
  _AnimatedIntroPageState createState() => _AnimatedIntroPageState();
}

class _AnimatedIntroPageState extends BasePageState<AnimatedIntroPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => AnimatedIntroScreen();
}
