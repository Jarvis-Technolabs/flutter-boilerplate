import 'package:flutter/material.dart';

showSnackBarWithActionWidget({
  required Widget contentWidget,
  int? durationInSecond,
  required BuildContext context,
  required Color backgroundColor,
  required String actionLabel,
  required Color actionTextColor,
  required VoidCallback actionOnPress,
}) =>
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(
            seconds: durationInSecond ?? 10,
          ),
          content: contentWidget,
          backgroundColor: backgroundColor,
          action: SnackBarAction(
            label: actionLabel,
            textColor: actionTextColor,
            onPressed: () => actionOnPress(),
          ),
        ),
      ),
    );

showSnackBar({
  required Widget contentWidget,
  int? durationInSecond,
  required BuildContext context,
  required Color backgroundColor,
}) =>
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(
            seconds: durationInSecond ?? 10,
          ),
          content: contentWidget,
          backgroundColor: backgroundColor,
        ),
      ),
    );
