import 'package:another_flushbar/flushbar.dart';
import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/core/ui/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../../../core/const/string_constants.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../core/localizations/localization_extension.dart';
import '../../../core/ui/widgets/custom_info_overlay_widget.dart';

class OverlayWidgetsExampleScreen extends BaseBlocWidget {
  @override
  State<OverlayWidgetsExampleScreen> createState() =>
      _OverlayWidgetsExampleScreenState();
}

class _OverlayWidgetsExampleScreenState
    extends BaseBlocWidgetState<OverlayWidgetsExampleScreen> {
  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_OVERLAY_WIDGET)
              .getWhiteColor17W500Inter(
                  screenUtil: screenUtil, appColors: appColors),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              title:
                  context.tr(LABEL_SHOW_SNACKBAR),
              backgroundColor: appColors.primaryColor,
              buttonTextColor: appColors.whiteColor,
              selectHandler: () {
                /// TODO - Use this method when you want to show snack bar with action
                showSnackBarWithActionWidget(
                    contentWidget: context.tr(LABEL_SHOW_SNACKBAR)
                        .getWhiteColor14W400Inter(
                            screenUtil: screenUtil, appColors: appColors),
                    durationInSecond: 7,
                    context: context,
                    backgroundColor: appColors.primaryColor,
                    actionLabel:
                        context.tr(LABEL_RETRY),
                    actionTextColor: appColors.whiteColor,
                    actionOnPress: () => {
                          /// TODO implement action button press
                        });

                /// TODO - Use below method when you want to show snack bar with out action

                // showSnackBar(
                //     contentWidget: AppLocalizations.of(context)
                //         .translate(LABEL_SHOW_SNACKBAR)
                //         .getWhiteColor14W400Inter(
                //         screenUtil: screenUtil, appColors: appColors),
                //     durationInSecond: 7,
                //     context: context,
                //     backgroundColor: appColors.primaryColor,
                //     );
              },
            ).paddingOnly(
              screenUtil,
              paddingBottom: 30,
            ),
            PrimaryButton(
              title:
                  context.tr(LABEL_SHOW_FLUSHBAR),
              backgroundColor: appColors.primaryColor,
              buttonTextColor: appColors.whiteColor,
              selectHandler: () async {
                /// TODO - Use this method when you want to show flush bar and also there are more properties to customise flush bar as per your design

                await Flushbar(
                  margin: EdgeInsets.all(screenUtil.setHeight(20)),
                  padding: EdgeInsets.all(screenUtil.setHeight(15)),
                  borderRadius: BorderRadius.circular(screenUtil.setHeight(10)),
                  backgroundColor: appColors.primaryColor.withOpacity(0.8),
                  icon: Icon(
                    Icons.info_outline,
                    size: 28.0,
                    color: appColors.whiteColor,
                  ),
                  titleText: context.tr(LABEL_SHOW_FLUSHBAR)
                      .getWhiteColor17W500Inter(
                          screenUtil: screenUtil, appColors: appColors),
                  messageText: context.tr(LABEL_SHOW_FLUSHBAR)
                      .getWhiteColor17W500Inter(
                          screenUtil: screenUtil, appColors: appColors),
                  duration: Duration(seconds: 3),
                  flushbarPosition: FlushbarPosition.BOTTOM,
                ).show(context);
              },
            ).paddingOnly(
              screenUtil,
              paddingBottom: 30,
            ),
            PrimaryButton(
              title: context.tr(LABEL_SHOW_TOAST),
              backgroundColor: appColors.primaryColor,
              buttonTextColor: appColors.whiteColor,
              selectHandler: () => {
                /// TODO - Use this method when you want to show Toast message

                commonUtilities.showToast(
                  message:
                      context.tr(LABEL_SHOW_TOAST),
                  backgroundColors: appColors.blackColor,
                  textColors: appColors.whiteColor,
                )
              },
            ).paddingOnly(
              screenUtil,
              paddingBottom: 30,
            ),
          ],
        ).paddingSymmetric(screenUtil: screenUtil, horizontalPadding: 20),
      );
}
