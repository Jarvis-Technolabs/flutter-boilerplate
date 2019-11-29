import 'package:intl/intl.dart';

class DateUtils {
  static DateTime initialStartingDate = DateTime(2015);
  static DateTime initialEndingDate = DateTime.now();

  static String getCurrentWeekDay(String date) =>
      DateFormat(DateFormat.ABBR_WEEKDAY, "en").format(DateTime.parse(date));

  static String getMonthDay(String date) =>
      DateFormat(DateFormat.DAY, "en").format(DateTime.parse(date));

  static String getYearNumber(String date) =>
      DateFormat(DateFormat.YEAR, "en").format(DateTime.parse(date));

  static String getMonthNumber(String date) =>
      DateFormat(DateFormat.NUM_MONTH, "en").format(DateTime.parse(date));

  static String getHour(String date) =>
      DateFormat(DateFormat.HOUR24, "en").format(DateTime.parse(date));

  static String getMinutes(String date) =>
      DateFormat(DateFormat.MINUTE, "en").format(DateTime.parse(date));

  static String getMonth(String date) =>
      DateFormat(DateFormat.ABBR_MONTH, "en").format(DateTime.parse(date));

  static String getFullDate(String date) =>
      DateFormat("EEE, dd MMMM yyyy").format(DateTime.parse(date));

  static String getTime(String date) =>
      DateFormat("hh:mm aa").format(DateTime.parse(date));

  static String getPreviousDateForMessages() => DateFormat("yyyy-MM-dd").format(
      DateTime.parse(DateTime.now().subtract(Duration(days: 365)).toString()));

  static String getDay(String date) =>
      DateFormat('dd').format(DateTime.parse(date));

  static String getDateForApi(String date) =>
      DateFormat("dd/MM/yyyy").format(DateTime.parse(date));

  static String getDateWithFullMonth(DateTime date) =>
      DateFormat("dd MMM yyyy").format(date);

  static String getMonthForAttendance(DateTime date) =>
      DateFormat("mm").format(date);

  static String getYearForAttendance(DateTime date) =>
      DateFormat("yyyy").format(date);

  static String getDateForRegistration(String date) =>
      DateFormat("dd/MM/yyyy").format(DateFormat("dd MMM yyyy").parse(date));
}
