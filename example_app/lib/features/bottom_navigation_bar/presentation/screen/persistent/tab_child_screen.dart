import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../../core/ui/widgets/button.dart';
import 'demo_navigation_screen.dart';

class TabChildScreen extends BaseScreen {
  final String title;
  final bool? withNavBar;
  TabChildScreen({
    required this.title,
    this.withNavBar = true,
  });

  @override
  State<TabChildScreen> createState() => _TabChildScreenState();
}

class _TabChildScreenState extends BaseScreenState<TabChildScreen> {
  @override
  Widget body(BuildContext context) => Container(
        color: appColors.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              title: widget.title,
              backgroundColor: appColors.primaryColor,
              buttonTextColor: appColors.whiteColor,
              selectHandler: () async {
                /// navigate to demo screen
                navigateToDemoScreen(withNavigationBar: widget.withNavBar);
              },
            ).paddingOnly(
              screenUtil,
              paddingBottom: 20,
            ),
          ],
        ).paddingAll(padding: 20, screenUtil: screenUtil),
      );

  /// manage navigate to screen with or without navigation bar
  void navigateToDemoScreen({bool? withNavigationBar}) =>
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: DemoNavigationScreen(
          showAppBar: withNavigationBar != null ? !withNavigationBar : true,
        ),
        withNavBar: withNavigationBar, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
}
