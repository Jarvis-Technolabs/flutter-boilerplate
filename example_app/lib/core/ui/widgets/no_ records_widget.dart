import 'package:example_app/core/localizations/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:example_app/core/const/string_constants.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';

import '../../localizations/app_localizations.dart';

class NoRecordsWidget extends BaseScreen {
  final String? title;
  final String? message;

  NoRecordsWidget({Key? key, this.title, this.message}) : super(key: key);

  @override
  State<NoRecordsWidget> createState() => _NoRecordsWidgetsState();
}

class _NoRecordsWidgetsState extends BaseScreenState<NoRecordsWidget> {
  @override
  Widget body(_) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: (widget.title ??
                    context.tr(LABEL_NO_RECORD_FOUND))
                .getText18W700Text(
              screenUtil: screenUtil,
              color: appColors.textColor,
              maxLine: 3,
              textAlign: TextAlign.center,
            ),
          ),
          if (widget.message != null && widget.message!.isNotEmpty) ...[
            widget.message!
                .getSubText18W500WithLineHeightText(
                  textAlign: TextAlign.center,
                  screenUtil: screenUtil,
                  appColors: appColors,
                )
                .paddingOnly(
                  screenUtil,
                  paddingTop: 18,
                ),
          ]
        ],
      ).paddingOnly(
        screenUtil,
        paddingLeft: 16.0,
        paddingRight: 16.0,
      );
}
