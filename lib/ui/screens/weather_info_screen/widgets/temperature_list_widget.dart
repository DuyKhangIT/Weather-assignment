import 'package:flutter/material.dart';
import 'package:huynh_duy_khang_home_assignment/ui/screens/weather_info_screen/widgets/temperature_widget.dart';

class TemperatureListWidget extends StatelessWidget {
  const TemperatureListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return const TemperatureWidget(
              dayOfWeek: 'Tuesday',
              temperature: '20 C',
            );
          },
        ),
      ),
    );
  }
}
