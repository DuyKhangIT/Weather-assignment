class StringUtils {
  static String getWeekdayFromDateTimeString(DateTime dateTime) {
    List<String> weekdays = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];

    int weekdayIndex = dateTime.weekday % 7;
    return weekdays[weekdayIndex];
  }
}
