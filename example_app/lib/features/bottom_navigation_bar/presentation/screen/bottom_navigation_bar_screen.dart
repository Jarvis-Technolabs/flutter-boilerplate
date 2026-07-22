import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/features/bottom_navigation_bar/presentation/screen/default/dafault_navigation_bar_screen.dart';
import 'package:example_app/features/bottom_navigation_bar/presentation/screen/persistent/persistent_navigation_bar_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/const/string_constants.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/localizations/localization_extension.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/ui/widgets/button.dart';

class BottomNavigationBarScreen extends BaseBlocWidget {
  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState
    extends BaseBlocWidgetState<BottomNavigationBarScreen> {
  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_BOTTOM_NAVIGATION_BAR_EXAMPLE)
              .getWhiteColor17W500Inter(
                  screenUtil: screenUtil, appColors: appColors),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Below button for default flutter navigation bar
            PrimaryButton(
              title: context.tr(LABEL_DEFAULT_BOTTOM_NAVIGATION_BAR),
              backgroundColor: appColors.primaryColor,
              buttonTextColor: appColors.whiteColor,
              selectHandler: () async {
                navigatePush(context, DefaultNavigationBarScreen());
              },
            ).paddingOnly(
              screenUtil,
              paddingBottom: 20,
            ),

            /// Below button for persistent flutter navigation bar

            PrimaryButton(
              title: context.tr(LABEL_PERSISTENT_NAVIGATION_BAR),
              backgroundColor: appColors.primaryColor,
              buttonTextColor: appColors.whiteColor,
              selectHandler: () async {
                navigatePush(context, PersistentBottomNavigationBarScreen());
              },
            ).paddingOnly(
              screenUtil,
              paddingBottom: 20,
            ),
          ],
        ).paddingAll(padding: 20, screenUtil: screenUtil),
      );
}
