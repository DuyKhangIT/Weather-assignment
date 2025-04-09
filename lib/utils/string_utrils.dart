class StringUtils {
  static String kelvinToCelsiusString(double kelvin) {
    final celsius = kelvin - 273.15;
    return "${celsius.toStringAsFixed(1)}°C";
  }

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
