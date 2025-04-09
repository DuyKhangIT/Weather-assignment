import 'package:flutter/material.dart';
import 'package:huynh_duy_khang_home_assignment/ui/screens/weather_info_screen/widgets/temperature_widget.dart';

import '../../../../core/ui_model/future_weather_ui_model.dart';
import '../../../../utils/string_utrils.dart';

class TemperatureListWidget extends StatelessWidget {
  final FutureWeatherUiModel futureWeatherList;
  const TemperatureListWidget({
    super.key,
    required this.futureWeatherList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: futureWeatherList.futureWeatherList.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final weather = futureWeatherList.futureWeatherList[index];
            return TemperatureWidget(
              dayOfWeek: StringUtils.getWeekdayFromDateTimeString(
                weather.dayOfWeek,
              ),
              temperature: StringUtils.kelvinToCelsiusString(
                weather.temperature,
              ),
            );
          },
        ),
      ),
    );
  }
}
