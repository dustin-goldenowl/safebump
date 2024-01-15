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
}
