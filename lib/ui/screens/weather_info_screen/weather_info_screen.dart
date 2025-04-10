import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huynh_duy_khang_home_assignment/ui/screens/weather_info_screen/weather_info_body.dart';

import 'package:provider/provider.dart';

import '../../../core/view_models/screens/interfaces/iweather_info_view_model.dart';
import '../../../global/router.dart';
import '../../common/loading_widget.dart';

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
    _viewModel.fetchFutureWeather();
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
            return WeatherInfoBody(
              cityName: viewModel.weatherInfo?.cityName ?? '',
              temperature: viewModel.weatherInfo?.temperature != null
                  ? viewModel.weatherInfo!.temperature.toString()
                  : '',
              futureWeatherList: viewModel.futureWeather,
            );
          }
        },
      ),
    );
  }
}
