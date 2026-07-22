import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_screen.dart';
import 'package:flutter_clean_architecture/core/const/string_constants.dart';
import 'package:flutter_clean_architecture/core/localizations/app_localizations.dart';
import 'package:flutter_clean_architecture/core/localizations/localization_extension.dart';
import 'package:flutter_clean_architecture/core/ui/theme/colors/colors_inf.dart';
import 'package:flutter_clean_architecture/core/ui/theme/text_extension/text_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/button.dart';

class AppErrorWidget extends BaseScreen {
  final String message;
  final VoidCallback? onRetry;

  AppErrorWidget({
    Key? key,
    required this.message,
    this.onRetry,
  }) : super(key: key);

  @override
  State<AppErrorWidget> createState() => _AppErrorWidgetState();
}

class _AppErrorWidgetState extends BaseScreenState<AppErrorWidget> {
  @override
  Widget body(_) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AppLocalizations.of(context)
                .translateOrKey(widget.message)
                .getSubText18W500Text(
                  textAlign: TextAlign.center,
                  maxLine: 7,
                  screenUtil: screenUtil,
                  appColors: appColors,
                )
                .paddingOnly(
                  screenUtil,
                  paddingBottom: 18,
                ),
          ),
          OutLineButton(
            title: context.tr(LABEL_RETRY),
            borderColor: appColors.radioFillColor,
            selectHandler: widget.onRetry,
            buttonWidth: MediaQuery.of(context).size.width * 0.3,
            buttonHeight: MediaQuery.of(context).size.height * 0.01,
          ),
        ],
      ).paddingAll(
        padding: 16,
        screenUtil: screenUtil,
      );
}

void showAppErrorSnackBar({
  required BuildContext context,
  required String message,
  required VoidCallback onRetry,
  required ColorsInf appColors,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: appColors.errorColor,
      content: Text(AppLocalizations.of(context).translateOrKey(message)),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: context.tr(LABEL_RETRY),
        onPressed: onRetry,
      ),
    ),
  );
}
