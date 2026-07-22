import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:example_app/core/localizations/localization_extension.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/features/bottom_navigation_bar/presentation/screen/persistent/tab_child_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/const/string_constants.dart';
import '../../../../../core/localizations/app_localizations.dart';

class PersistentBottomNavigationBarScreen extends BaseScreen {
  const PersistentBottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<PersistentBottomNavigationBarScreen> createState() =>
      _PersistentBottomNavigationBarScreenState();
}

class _PersistentBottomNavigationBarScreenState
    extends BaseScreenState<PersistentBottomNavigationBarScreen> {
  /// List<Widget>
  List<Widget> _pages = [];
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();

    /// Initialize PersistentTabController
    _controller = PersistentTabController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// ADD widgets to the _pages list
    _pages = <Widget>[
      TabChildScreen(
          withNavBar: true,
          title: context.tr(LABEL_SCREEN_WITH_BOTTOM_NAVIGATION_BAR)),
      TabChildScreen(
          withNavBar: false,
          title: context.tr(LABEL_SCREEN_WITHOUT_BOTTOM_NAVIGATION_BAR))
    ];
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_PERSISTENT_NAVIGATION_BAR)
              .getWhiteColor17W500Inter(
                  screenUtil: screenUtil, appColors: appColors),
        ),
        body: GestureDetector(
          /// onHorizontalDragEnd used for change the tab based on user swipe the screen
          onHorizontalDragEnd: (DragEndDetails details) {
            if (details.primaryVelocity! < 0 &&
                _controller.index != _pages.length - 1) {
              _controller.index++;
              _controller.jumpToTab(_controller.index);
            } else if (details.primaryVelocity! > 0 && _controller.index != 0) {
              _controller.index--;
              _controller.jumpToTab(_controller.index);
            }
          },
          child: PersistentTabView(
            context,
            controller: _controller,
            screens: _pages,
            items: [
              PersistentBottomNavBarItem(
                icon: const Icon(Icons.home),
                title: context.tr(LABEL_HOME),
                activeColorPrimary: appColors.primaryColor,
                activeColorSecondary: appColors.textColor,
                inactiveColorPrimary: appColors.textColor.withOpacity(0.4),
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(Icons.menu),
                title: context.tr(LABEL_MORE),
                activeColorPrimary: appColors.primaryColor,
                activeColorSecondary: appColors.textColor,
                inactiveColorPrimary: appColors.textColor.withOpacity(0.4),
              ),
            ],
            resizeToAvoidBottomInset: true,
            navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
                ? 0.0
                : kBottomNavigationBarHeight,
            bottomScreenMargin: 0,
            backgroundColor: appColors.whiteColor,
            navBarStyle: NavBarStyle
                .style3, // Choose the nav bar style with this property
          ),
        ));
  }
}
