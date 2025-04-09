import 'package:flutter/material.dart';
import 'package:huynh_duy_khang_home_assignment/global/router.dart';

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  static final currentRouteNamesInNavStack =
      List<String?>.empty(growable: true);

  void _sendScreenView(PageRoute<dynamic> route) {
    var screenName = route.settings.name;
    MyRouter.onRouteChanged(screenName);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _sendScreenView(route);
      currentRouteNamesInNavStack.add(route.settings.name);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _sendScreenView(newRoute);
      currentRouteNamesInNavStack[currentRouteNamesInNavStack.length - 1] =
          newRoute.settings.name;
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreenView(previousRoute);
      currentRouteNamesInNavStack.removeLast();
    }
  }
}
