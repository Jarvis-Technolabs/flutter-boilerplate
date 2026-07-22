import 'dart:async';

import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:example_app/core/localizations/localization_extension.dart';
import 'package:example_app/core/localizations/localization_extension.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/const/string_constants.dart';
import '../../../../../core/localizations/app_localizations.dart';

class DefaultNavigationBarScreen extends BaseScreen {
  const DefaultNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<DefaultNavigationBarScreen> createState() =>
      _DefaultNavigationBarScreenState();
}

class _DefaultNavigationBarScreenState
    extends BaseScreenState<DefaultNavigationBarScreen> {
  /// List<Widget>
  static List<Widget> _pages = [];

  /// initial selected index
  int _selectedIndex = 0;

  /// initialize selected index stream controller
  StreamController<int> _selectedBottomNavigationBarIndexController =
      StreamController();
  late PageController _pageViewController;

  @override
  void initState() {
    /// initialize pageView controller
    _pageViewController = new PageController(
      initialPage: _selectedIndex,
    );
    super.initState();
  }

  @override
  Widget body(BuildContext context) {
    /// Add widget to the _pages list
    _pages = <Widget>[
      Icon(
        Icons.home,
        size: screenUtil.setHeight(150),
      ),
      Icon(
        Icons.menu,
        size: screenUtil.setHeight(150),
      ),
    ];
    return StreamBuilder<int>(
        stream: _selectedBottomNavigationBarIndexController.stream,
        initialData: 0,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: appColors.screenBgColor,
            appBar: AppBar(
              title: context.tr(LABEL_DEFAULT_BOTTOM_NAVIGATION_BAR)
                  .getWhiteColor17W500Inter(
                      screenUtil: screenUtil, appColors: appColors),
            ),
            body: PageView(
              controller: _pageViewController,
              onPageChanged: (newPage) {
                this._selectedIndex = newPage;
                _onItemTapped(_selectedIndex);
              }, // Here, pageView is used for change the tab on swipe
              children: _pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              backgroundColor: appColors.primaryColor,
              selectedItemColor: appColors.whiteColor,
              unselectedItemColor: appColors.whiteColor.withOpacity(0.4),
              selectedLabelStyle: getSelectedBottomNavigationItemLabelStyle(
                  screenUtil: screenUtil, appColors: appColors),
              unselectedLabelStyle: getUnSelectedBottomNavigationItemLabelStyle(
                  screenUtil: screenUtil, appColors: appColors),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: context.tr(LABEL_HOME),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: context.tr(LABEL_MORE),
                ),
              ],
            ),
          );
        });
  }

  /// manage the on change tab
  void _onItemTapped(int index) {
    _selectedIndex = index;
    _pageViewController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    _selectedBottomNavigationBarIndexController.add(index);
  }
}
