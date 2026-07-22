import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_screen.dart';
import 'package:flutter_clean_architecture/core/localizations/app_localizations.dart';
import 'package:flutter_clean_architecture/core/localizations/localization_extension.dart';
import 'package:flutter_clean_architecture/core/ui/theme/text_extension/text_extension.dart';

class CommonAppBar extends BaseScreen implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final Color? bgColor;
  final bool isTitleCenter;

  CommonAppBar({
    Key? key,
    required this.title,
    this.onBack,
    this.actions,
    this.bgColor,
    this.isTitleCenter = false,
  }) : super(key: key);

  @override
  _CommonAppBarState createState() => _CommonAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CommonAppBarState extends BaseScreenState<CommonAppBar> {
  @override
  Widget body(_) => AppBar(
        scrolledUnderElevation: 0,
        title: context.tr(widget.title)
            .getAppBarTitleText(
              screenUtil: screenUtil,
              appColors: appColors,
              maxLine: 2,
            ),
      );
}
