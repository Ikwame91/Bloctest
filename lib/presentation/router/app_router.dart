import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/home_screen.dart';
import 'package:flutter_application_1/presentation/screens/second_screen.dart';
import 'package:flutter_application_1/presentation/screens/third_screen.dart';

class AppRouter {
  MaterialPageRoute? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
              const HomeScreen(title: 'HomeScreen', color: Colors.blueAccent),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
              title: 'SecondScreen', color: Colors.redAccent),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
              title: 'ThirdScreen', color: Colors.greenAccent),
        );
      default:
        return null;
    }
  }
}
