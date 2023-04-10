import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigateTo(String routeName, {Object? arg}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arg);
  }

  static replaceTo(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}
