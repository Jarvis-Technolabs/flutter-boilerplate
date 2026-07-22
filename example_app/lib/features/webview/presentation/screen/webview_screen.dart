import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/const/string_constants.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/localizations/localization_extension.dart';
import '../../../../core/ui/widgets/common_webview_widget.dart';

class WebViewScreen extends BaseBlocWidget {
  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends BaseBlocWidgetState<WebViewScreen> {
  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title:context.tr(LABEL_WEB_VIEW_IMPL)
              .getWhiteColor17W500Inter(
                screenUtil: screenUtil,
                appColors: appColors,
              ),
        ),
        body: CommonWebViewWidget(
          httpUrl: 'https://www.google.com',
        ).paddingAll(padding: 5, screenUtil: screenUtil),
      );
}
