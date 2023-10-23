import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/enum.dart';
import 'package:flutter_application_1/logic/cubit/counter_cubit_cubit.dart';
import 'package:flutter_application_1/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;
  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
          //  BlocProvider.of<CounterCubit>(context).internetCubit),
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
          //  BlocProvider.of<CounterCubit>(context).internetCubit),
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Wifi) {
                    return const Text('WIFI');
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Mobile) {
                    return const Text('Mobile');
                  } else if (state is InternetDisconnected) {
                    return const Text(
                      'Disconnected',
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              const Divider(
                height: 5,
              ),
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('INCREMENTED'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  } else if (state.wasIncremented == false) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Decremented'),
                      duration: Duration(milliseconds: 300),
                    ));
                  }
                },
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      'WTF NEGATIVE  ${state.counterValue}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  } else if (state.counterValue % 5 == 0) {
                    return Text(
                      'WOOOOW    ${state.counterValue}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  } else if (state.counterValue == 5) {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: Text('${widget.title}'),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: Text('${widget.title} #2'),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: widget.color,
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
                child: const Text('Go to Second Screen'),
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: widget.color,
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                child: const Text('Go to Third Screen'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
