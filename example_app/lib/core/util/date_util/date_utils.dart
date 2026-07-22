import 'package:example_app/core/ui/theme/colors/colors_inf.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../const/app_constants.dart';

class DateUtil {
  ///get24ClockTimeFromDateTime
  static String get24ClockTimeFromDateTime({DateTime? dateTime}) =>
      dateTime != null ? DateFormat("HH:mm").format(dateTime) : "";

  ///get12ClockTimeFromDateTime
  static String get12ClockTimeFromDateTime({DateTime? dateTime}) =>
      dateTime != null ? DateFormat("hh:mm aa").format(dateTime) : "";

  ///get24ClockTimeFromApiDateString
  static String get24ClockTimeFromApiDateString({String? date}) =>
      date != null && date.isNotEmpty
          ? DateFormat("HH:mm").format(DateFormat(API_DATE_FORMAT).parse(date))
          : "";

  ///get12ClockTimeFromApiDateString
  static String get12ClockTimeFromApiDateString({String? date}) =>
      date != null && date.isNotEmpty
          ? DateFormat("hh:mm aa")
              .format(DateFormat(API_DATE_FORMAT).parse(date))
          : "";

  ///getDDMMYYYYFromApiDateFormat
  static String getDDMMYYYYFromApiDateFormat({String? date}) => date != null &&
          date.isNotEmpty
      ? DateFormat('dd/MM/yyyy').format(DateFormat(API_DATE_FORMAT).parse(date))
      : "";

  ///getSendAPIDateFormat
  static String getSendAPIDateFormat({DateTime? date}) =>
      date != null ? DateFormat("dd/MM/yyyy").format(date) : "";

  static Future<DateTime?> selectDateFromPicker(
      {required BuildContext context, required ColorsInf appColors}) async {
    final DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: appColors.primaryColor, // <-- SEE HERE
                onPrimary: appColors.whiteColor, // <-- SEE HERE
                onSurface: appColors.textColor, // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: appColors.textColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2050));
    return pickedDate;
  }

  static Future<TimeOfDay?> selectTime(
      {required BuildContext context, required ColorsInf appColors}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    return pickedTime;
  }
}
