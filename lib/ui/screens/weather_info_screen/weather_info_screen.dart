import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huynh_duy_khang_home_assignment/ui/screens/weather_info_screen/weather_info_body.dart';

import 'package:provider/provider.dart';

import '../../../core/view_models/screens/interfaces/iweather_info_view_model.dart';
import '../../../global/router.dart';
import '../../../utils/string_utrils.dart';
import '../../common/loading_widget.dart';
import '../error_screen/error_screen.dart';

class WeatherInfoScreen extends StatefulWidget {
  const WeatherInfoScreen({super.key});

  @override
  State<WeatherInfoScreen> createState() => _WeatherInfoScreenState();
}

class _WeatherInfoScreenState extends State<WeatherInfoScreen> {
  late IWeatherInfoViewModel _viewModel;

  @override
  void initState() {
    _viewModel = context.read<IWeatherInfoViewModel>();
    _viewModel.addListener(_viewModelListener);
    _viewModel.fetchWeatherInfo();
    super.initState();
  }

  void _viewModelListener() {
    if (_viewModel.hasError) {
      Get.toNamed(MyRouter.error);
    }
  }

  @override
  void dispose() {
    _viewModel.removeListener(_viewModelListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IWeatherInfoViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const LoadingWidget();
          } else {
            // Thành công mới show WeatherInfoBody
            return WeatherInfoBody(
              cityName: viewModel.weatherInfo?.cityName ?? '',
              temperature: StringUtils.kelvinToCelsiusString(
                viewModel.weatherInfo?.temperature ?? 0,
              ),
            );
          }
        },
      ),
    );
  }
}
