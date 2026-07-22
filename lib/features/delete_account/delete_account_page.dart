import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/base_page.dart';

import 'presentation/screen/delete_account_screen.dart';

class DeleteAccountPage extends BasePage {
  DeleteAccountPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends BasePageState<DeleteAccountPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => DeleteAccountScreen();
}
