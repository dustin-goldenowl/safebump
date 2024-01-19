import 'package:intl/intl.dart';

class DateTimeUtils {
  static List<DateTime> createWeekOfToday(DateTime today) {
    List<DateTime> listDays = List.empty(growable: true);
    for (int i = today.weekday - 1; i > 0; i--) {
      listDays.add(today.subtract(Duration(days: i)));
    }
    listDays.add(today);
    for (int i = 1; i < (8 - today.weekday); i++) {
      listDays.add(today.add(Duration(days: i)));
    }
    return listDays;
  }

  // year - month - day 00:00:00
  static DateTime convertToStartedDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  static int numOfWeeksOfYear(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  static int weekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeksOfYear(date.year - 1);
    } else if (woy > numOfWeeksOfYear(date.year)) {
      woy = 1;
    }
    return woy;
  }

  static DateTime addTimeIntoDate({required DateTime date, required DateTime time}) {
    return DateTime(
        date.year, date.month, date.day, time.hour, time.minute, time.second);
  }
}
