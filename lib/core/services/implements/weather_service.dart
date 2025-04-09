import 'dart:async';

import '../../../global/global_data.dart';
import '../../../global/locator.dart';
import '../interfaces/iweather_service.dart';

class WeatherService implements IWeatherService {
  final _globalData = locator<GlobalData>();

  @override
  Future<List<String>> getUsers() async {
    return [""];
  }
}
