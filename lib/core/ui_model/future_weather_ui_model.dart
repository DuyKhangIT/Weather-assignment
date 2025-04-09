class FutureWeatherUiModel {
  final List<FutureWeatherObjectUiModel> futureWeatherList;

  FutureWeatherUiModel({
    required this.futureWeatherList,
  });
}

class FutureWeatherObjectUiModel {
  final DateTime dayOfWeek;
  final double temperature;

  FutureWeatherObjectUiModel({
    required this.dayOfWeek,
    required this.temperature,
  });
}
