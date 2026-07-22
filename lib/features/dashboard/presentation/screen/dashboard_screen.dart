import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_bloc_widget.dart';
import 'package:flutter_clean_architecture/core/const/string_constants.dart';
import 'package:flutter_clean_architecture/core/localizations/app_localizations.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter_clean_architecture/features/home/home_page.dart';
import 'package:flutter_clean_architecture/features/notification/notification_page.dart';
import 'package:flutter_clean_architecture/features/settings/setting_page.dart';

import '../../../../core/localizations/localization_extension.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_state.dart';

class DashboardScreen extends BaseBlocWidget {
  DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends BaseBlocWidgetState<DashboardScreen> {
  int _selectedIndex = 0;
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {};

  List<Widget> _pages = [];
  final GlobalKey<CustomBottomNavigationBarState> _bottomNavKey =
      GlobalKey<CustomBottomNavigationBarState>();

  bool isNestedBottomNavBar = false;

  StreamController<bool> refreshStreamController = StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(),
      NotificationPage(),
      SettingPage(),
    ];
    if (isNestedBottomNavBar) {
      for (int i = 0; i < _pages.length; i++) {
        navigatorKeys[i] = GlobalKey<NavigatorState>();
      }
    }
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    refreshStreamController.add(true);
  }

  @override
  Widget getCustomBloc() => BlocConsumer<DashboardBloc, DashboardState>(
        listener: (_, state) {},
        builder: (_, state) => StreamBuilder<bool>(
          stream: refreshStreamController.stream,
          builder: (_, snapshot) => Scaffold(
            backgroundColor: appColors.screenBgColor,
            body: isNestedBottomNavBar
                ? buildNavigator()
                : _pages[_selectedIndex],
            bottomNavigationBar: CustomBottomNavigationBar(
              key: _bottomNavKey,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label:
                  context.tr(LABEL_DASHBOARD),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: context.tr(LABEL_NOTIFICATION),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: context.tr(LABEL_SETTINGS),
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      );

  Widget buildNavigator() => Navigator(
        key: navigatorKeys[_selectedIndex],
        onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
          builder: (_) => _pages.elementAt(_selectedIndex),
        ),
      );

  void hideBottomNav() {
    _bottomNavKey.currentState?.hideBottomNav();
  }

  void showBottomNav() {
    _bottomNavKey.currentState?.showBottomNav();
  }
}

/// hide/show bottom tab from another screen
// final dashboardState =
//     context.findAncestorStateOfType<DashboardScreenState>();
// dashboardState?.hideBottomNav();
// dashboardState?.showBottomNav();
