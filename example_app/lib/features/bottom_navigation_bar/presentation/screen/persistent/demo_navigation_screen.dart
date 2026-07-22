import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/localizations/app_localizations.dart';
import 'package:example_app/core/localizations/localization_extension.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../core/const/string_constants.dart';

class DemoNavigationScreen extends BaseBlocWidget {
  final bool showAppBar;

  DemoNavigationScreen({required this.showAppBar});
  @override
  State<DemoNavigationScreen> createState() => _DemoNavigationScreenState();
}

class _DemoNavigationScreenState
    extends BaseBlocWidgetState<DemoNavigationScreen> {
  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: widget.showAppBar
            ? AppBar(
                title: context.tr(LABEL_DEMO_NAVIGATION_SCREEN)
                    .getWhiteColor17W500Inter(
                        screenUtil: screenUtil, appColors: appColors),
              )
            : null,
        body: Center(
          child: context.tr(LABEL_DEMO_NAVIGATION_SCREEN)
              .getTextColor17W500Inter(
                  screenUtil: screenUtil, appColors: appColors),
        ),
      );
}
