import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/cubit/counter_cubit_cubit.dart';
import 'package:flutter_application_1/logic/cubit/internet_cubit.dart';
import 'package:flutter_application_1/presentation/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter, required this.connectivity});

  final AppRouter appRouter;
  final Connectivity connectivity;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}

//BlocBuilder helps rebuild the UI