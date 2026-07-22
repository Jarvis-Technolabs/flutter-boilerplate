import 'package:example_app/core/base/base_page.dart';
import 'package:example_app/features/webview/presentation/screen/webview_screen.dart';
import 'package:flutter/material.dart';

class WebViewPage extends BasePage {
  WebViewPage({Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends BasePageState<WebViewPage> {
  @override
  Widget getChildBlocWidget(BuildContext _) => WebViewScreen();
}
