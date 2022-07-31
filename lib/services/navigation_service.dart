import 'package:flutter/material.dart';

class NavigationService {
  // Service to navigate between pages
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigateTo(String routeName) {
    // Method to navigate to a page
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static replaceTo(String routeName) {
    // Method to replace to a page
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}
