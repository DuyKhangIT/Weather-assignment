import 'package:flutter/material.dart';
import 'package:huynh_duy_khang_home_assignment/core/ui_model/future_weather_ui_model.dart';
import 'package:huynh_duy_khang_home_assignment/ui/screens/weather_info_screen/widgets/temperature_list_widget.dart';

import '../../../utils/color_utils.dart';

class WeatherInfoBody extends StatelessWidget {
  final String cityName;
  final String temperature;
  final List<FutureWeatherUiModel>? futureWeatherList;
  const WeatherInfoBody({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.futureWeatherList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 56, bottom: 62),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      temperature,
                      style: const TextStyle(
                        fontSize: 96,
                        fontWeight: FontWeight.w700,
                        color: ColorUtils.blackText,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Image.asset(
                      'assets/icons/ic_celsius.png',
                      width: 90,
                      height: 90,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  cityName,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w100,
                    color: ColorUtils.blueDarkText,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          // Shadow Line
          Container(
            height: 1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset.zero,
                  blurRadius: 2,
                ),
              ],
            ),
          ),
          if (futureWeatherList != null)
            TemperatureListWidget(
              futureWeatherList: futureWeatherList!,
            ),
        ],
      ),
    );
  }
}
