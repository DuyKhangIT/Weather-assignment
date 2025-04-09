class StringUtils {
  static String kelvinToCelsiusString(double kelvin) {
    final celsius = kelvin - 273.15;
    return "${celsius.toStringAsFixed(1)}°C";
  }
}
