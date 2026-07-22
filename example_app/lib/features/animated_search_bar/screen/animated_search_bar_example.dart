import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/core/ui/widgets/animated_search_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/const/string_constants.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../core/localizations/localization_extension.dart';

class AnimatedSearchBarExample extends BaseBlocWidget {
  final SearchBoxAnimationType type;

  AnimatedSearchBarExample({required this.type});

  @override
  State<AnimatedSearchBarExample> createState() =>
      _AnimatedSearchBarExampleState();
}

class _AnimatedSearchBarExampleState
    extends BaseBlocWidgetState<AnimatedSearchBarExample> {
  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_ANIMATED_SEARCH_BAR)
              .getWhiteColor17W500Inter(
                  screenUtil: screenUtil, appColors: appColors),
        ),
        body: Column(
          children: [
            AnimatedCustomSearchWidget(
              animationType: widget.type,
              onSubmitted: (String text) {},
              hintList: [
                context.tr(SEARCH_FOR_RESTAURANTS),
                context.tr(SEARCH_FOR_CUISINES),
                context.tr(SEARCH_FOR_DISHES),
              ],
            )
          ],
        ).paddingOnly(screenUtil,
            paddingLeft: 16, paddingRight: 16, paddingTop: 16),
      );

  SizedBox sizedBox12() {
    return SizedBox(
      height: screenUtil.setHeight(12),
    );
  }
}
