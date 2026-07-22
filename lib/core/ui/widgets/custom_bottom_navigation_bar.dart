import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_screen.dart';

class CustomBottomNavigationBar extends BaseScreen {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final TextStyle? selectedFontStyle;
  final TextStyle? unselectedFontStyle;

  CustomBottomNavigationBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedFontStyle,
    this.unselectedFontStyle,
  }) : super(key: key);

  @override
  CustomBottomNavigationBarState createState() =>
      CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState
    extends BaseScreenState<CustomBottomNavigationBar> {
  bool _isVisible = true;
  StreamController<bool> refreshController = StreamController.broadcast();

  @override
  Widget body(BuildContext _) => StreamBuilder<bool>(
        stream: refreshController.stream,
        builder: (_, snapshot) => (snapshot.hasData
                ? snapshot.data!
                : _isVisible)
            ? BottomNavigationBar(
                items: widget.items,
                currentIndex: widget.currentIndex,
                onTap: widget.onTap,
                backgroundColor: widget.backgroundColor ?? appColors.whiteColor,
                selectedItemColor:
                    widget.selectedItemColor ?? appColors.primaryColor,
                unselectedItemColor:
                    widget.unselectedItemColor ?? appColors.cursorColor,
                selectedLabelStyle: widget.selectedFontStyle,
                unselectedLabelStyle: widget.unselectedFontStyle,
              )
            : SizedBox.shrink(),
      );

  void hideBottomNav() {
    _isVisible = false;
    refreshController.add(_isVisible);
  }

  void showBottomNav() {
    _isVisible = true;
    refreshController.add(_isVisible);
  }
}
