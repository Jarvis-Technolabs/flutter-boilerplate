import 'package:example_app/features/email_mobile_textview/screen/email_mobile_textview_screen.dart';
import 'package:flutter/material.dart';

import '../../core/base/base_page.dart';

class EmailMobileTextviewPage extends BasePage {
  EmailMobileTextviewPage({Key? key}) : super(key: key);

  @override
  _EmailMobileTextviewPageState createState() =>
      _EmailMobileTextviewPageState();
}

class _EmailMobileTextviewPageState
    extends BasePageState<EmailMobileTextviewPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => EmailMobileTextviewScreen();
}
