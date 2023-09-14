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
}
