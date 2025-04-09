import 'package:get_it/get_it.dart';

import '../core/services/implements/weather_service.dart';
import '../core/services/interfaces/iweather_service.dart';

void registerServiceSingletons(GetIt locator) {
  locator.registerLazySingleton<IWeatherService>(() => WeatherService());
}
