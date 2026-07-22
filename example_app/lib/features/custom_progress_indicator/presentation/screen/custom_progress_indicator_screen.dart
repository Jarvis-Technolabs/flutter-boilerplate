import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/routes/routes.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../core/const/string_constants.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/localizations/localization_extension.dart';

class CustomProgressIndicatorScreen extends BaseBlocWidget {
  @override
  State<CustomProgressIndicatorScreen> createState() =>
      _CustomProgressIndicatorScreenState();
}

class _CustomProgressIndicatorScreenState
    extends BaseBlocWidgetState<CustomProgressIndicatorScreen> {
  List<Color> _kDefaultRainbowColors = const [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_CUSTOM_PROGRESS_INDICATOR)
              .getWhiteColor17W500Inter(
                screenUtil: screenUtil,
                appColors: appColors,
              ),
        ),
        body: ListView.builder(
          itemBuilder: (_, index) => InkWell(
            onTap: () => navigateToIndicatorScreen(
              indicator: Indicator.values[index],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Indicator.values[index]
                      .toString()
                      .split('.')
                      .last
                      .getTextColor17W500Inter(
                        screenUtil: screenUtil,
                        appColors: appColors,
                        maxLine: 3,
                      )
                      .paddingOnly(
                        screenUtil,
                        paddingRight: 20,
                      ),
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: appColors.textColor,
                  size: screenUtil.setHeight(18),
                )
              ],
            ).paddingSymmetric(
              horizontalPadding: 20,
              verticalPadding: 20,
              screenUtil: screenUtil,
            ),
          ),
          itemCount: Indicator.values.length,
        ),
      );

  navigateToIndicatorScreen({
    required Indicator indicator,
    bool showPathBackground = false,
  }) {
    navigatePush(
      context,
      Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: indicator.toString().split('.').last.getWhiteColor17W500Inter(
                screenUtil: screenUtil,
                appColors: appColors,
              ),
        ),
        body: Center(
          child: LoadingIndicator(
            indicatorType: indicator,
            colors: _kDefaultRainbowColors,
            strokeWidth: 4.0,
            pathBackgroundColor: showPathBackground ? Colors.black45 : null,
          ),
        ).paddingAll(
          padding: 20,
          screenUtil: screenUtil,
        ),
      ),
    );
  }
}
