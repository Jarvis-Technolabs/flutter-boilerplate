import 'package:example_app/core/base/base_page.dart';
import 'package:flutter/material.dart';

import 'screen/google_map_example_screen.dart';

class GoogleMapExamplePage extends BasePage {
  GoogleMapExamplePage({Key? key}) : super(key: key);

  @override
  _GoogleMapExamplePageState createState() => _GoogleMapExamplePageState();
}

class _GoogleMapExamplePageState extends BasePageState<GoogleMapExamplePage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => GoogleMapExampleScreen();
}
