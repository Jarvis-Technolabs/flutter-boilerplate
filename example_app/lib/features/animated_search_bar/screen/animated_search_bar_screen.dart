import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/routes/routes.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/core/ui/widgets/animated_search_widget.dart';
import 'package:example_app/core/ui/widgets/button.dart';
import 'package:example_app/features/animated_search_bar/screen/animated_search_bar_example.dart';
import 'package:flutter/material.dart';

import '../../../../core/const/string_constants.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../core/localizations/localization_extension.dart';

class AnimatedSearchBarScreen extends BaseBlocWidget {
  @override
  State<AnimatedSearchBarScreen> createState() =>
      _AnimatedSearchBarScreenState();
}

class _AnimatedSearchBarScreenState
    extends BaseBlocWidgetState<AnimatedSearchBarScreen> {
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
            PrimaryButton(
              title: context.tr(LABEL_FADED),
              selectHandler: () {
                loadExample(SearchBoxAnimationType.faded);
              },
            ),
            sizedBox12(),
            PrimaryButton(
              title: context.tr(LABEL_TYPED),
              selectHandler: () {
                loadExample(SearchBoxAnimationType.typed);
              },
            ),
            sizedBox12(),
            PrimaryButton(
              title: context.tr(LABEL_WAVY),
              selectHandler: () {
                loadExample(SearchBoxAnimationType.wavy);
              },
            ),
            sizedBox12(),
            PrimaryButton(
              title: context.tr(LABEL_FLICKER),
              selectHandler: () {
                loadExample(SearchBoxAnimationType.flicker);
              },
            ),
            sizedBox12(),
            PrimaryButton(
              title: context.tr(LABEL_ROTATE),
              selectHandler: () {
                loadExample(SearchBoxAnimationType.rotate);
              },
            ),
          ],
        ).paddingOnly(screenUtil,
            paddingLeft: 32, paddingRight: 32, paddingTop: 32),
      );

  void loadExample(SearchBoxAnimationType type) {
    navigatePush(
      context,
      AnimatedSearchBarExample(type: type),
    );
  }

  SizedBox sizedBox12() {
    return SizedBox(
      height: screenUtil.setHeight(12),
    );
  }
}
