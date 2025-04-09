import 'package:flutter/material.dart';
import 'package:huynh_duy_khang_home_assignment/ui/screens/error_screen/error_screen.dart';
import 'package:huynh_duy_khang_home_assignment/ui/screens/loading_screen/loading_screen.dart';
import 'package:huynh_duy_khang_home_assignment/ui/screens/weather_info_screen/weather_info_screen.dart';

class MyRouter {
  static const String loading = '/loading';
  static const String error = '/error';
  static const String weatherInfo = '/weatherInfo';

  static PageRouteBuilder _buildRouteNavigationWithoutEffect(
    RouteSettings settings,
    Widget widget,
  ) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: Duration.zero,
      settings: settings,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    debugPrint('INFO - go to ${settings.name} Screen');
    switch (settings.name) {
      case loading:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const LoadingScreen(),
        );
      case error:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const ErrorScreen(),
        );
      case weatherInfo:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const WeatherInfoScreen(),
        );
      default:
        return _buildRouteNavigationWithoutEffect(
          settings,
          Scaffold(
            body: Center(
              child: Text('No route found: ${settings.name}.'),
            ),
          ),
        );
    }
  }

  static void onRouteChanged(String? screenName) {
    if (['', null].contains(screenName)) {
      return;
    }
  }
}
