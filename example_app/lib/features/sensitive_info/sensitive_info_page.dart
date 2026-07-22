import 'package:example_app/features/sensitive_info/screen/sensitive_info_screen.dart';
import 'package:flutter/material.dart';

import '../../core/base/base_page.dart';

class SensitiveInfoPage extends BasePage {
  SensitiveInfoPage({Key? key}) : super(key: key);

  @override
  _SensitiveInfoPageState createState() => _SensitiveInfoPageState();
}

class _SensitiveInfoPageState extends BasePageState<SensitiveInfoPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => SensitiveInfoScreen();
}
