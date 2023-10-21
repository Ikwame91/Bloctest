import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/cubit/counter_cubit_cubit.dart';
import 'package:flutter_application_1/presentation/screens/home_screen.dart';
import 'package:flutter_application_1/presentation/screens/second_screen.dart';
import 'package:flutter_application_1/presentation/screens/third_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: HomeScreen(title: 'HomeScreen', color: Colors.blueAccent),
            ),
        '/second': (context) => BlocProvider.value(
              value: _counterCubit,
              child:
                  SecondScreen(title: 'SecondScreen', color: Colors.redAccent),
            ),
        '/third': (context) => BlocProvider.value(
              value: _counterCubit,
              child:
                  ThirdScreen(title: 'ThirdScreen', color: Colors.greenAccent),
            )
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}

//BlocBuilder helps rebuild the UI