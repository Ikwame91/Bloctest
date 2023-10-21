import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/cubit/counter_cubit_cubit.dart';
import 'package:flutter_application_1/presentation/screens/home_screen.dart';
import 'package:flutter_application_1/presentation/screens/second_screen.dart';
import 'package:flutter_application_1/presentation/screens/third_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  MaterialPageRoute? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child:
                const HomeScreen(title: 'HomeScreen', color: Colors.blueAccent),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: _counterCubit,
              child: const SecondScreen(
                  title: 'SecondScreen', color: Colors.redAccent)),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: _counterCubit,
              child: const ThirdScreen(
                  title: 'ThirdScreen', color: Colors.greenAccent)),
        );
      default:
        return null;
    }
  }
}
