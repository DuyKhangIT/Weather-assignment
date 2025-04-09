import 'package:flutter/material.dart';
import 'package:huynh_duy_khang_home_assignment/ui/screens/weather_info_screen/widgets/temperature_list_widget.dart';
import 'package:huynh_duy_khang_home_assignment/utils/color_utils.dart';
import 'package:provider/provider.dart';

import '../../../core/view_models/screens/interfaces/iweather_info_view_model.dart';

class WeatherInfoScreen extends StatefulWidget {
  const WeatherInfoScreen({super.key});

  @override
  State<WeatherInfoScreen> createState() => _WeatherInfoScreenState();
}

class _WeatherInfoScreenState extends State<WeatherInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IWeatherInfoViewModel>(
      builder: (_, viewModel, __) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 56, bottom: 62),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: const Column(
                  children: [
                    Text(
                      '20',
                      style: TextStyle(
                        fontSize: 96,
                        fontWeight: FontWeight.w700,
                        color: ColorUtils.blackText,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Bangalore',
                      style: TextStyle(
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
              // Shadow Line
              const TemperatureListWidget(),
            ],
          ),
        );
      },
    );
  }
}
