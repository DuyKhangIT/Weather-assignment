import 'package:flutter/material.dart';

import '../ui/screens/home_screen/home_screen.dart';
import '../ui/screens/splash_screen/splash_screen.dart';

class MyRouter {
  static const String splash = '/splash';
  static const String home = '/home';

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
      case splash:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const SplashScreen(),
        );
      case home:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const HomeScreen(),
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
