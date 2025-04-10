import 'package:flutter/material.dart';
import 'package:huynh_duy_khang_home_assignment/utils/color_utils.dart';

class TemperatureWidget extends StatelessWidget {
  final String dayOfWeek;
  final String temperature;
  const TemperatureWidget({
    super.key,
    required this.dayOfWeek,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration:  BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            width: 1, 
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dayOfWeek,
            style: const TextStyle(
              fontSize: 16,
              color: ColorUtils.blackText,
              height: 1.2,
            ),
          ),
          Text(
            '$temperature C',
            style: const TextStyle(
              fontSize: 16,
              color: ColorUtils.blackText,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
