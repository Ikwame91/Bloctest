import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/constants/enum.dart';
import 'package:flutter_application_1/logic/cubit/internet_cubit.dart';

part 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription? internetStreamSubscription;
  CounterCubit(this.internetCubit) : super(CounterState(counterValue: 0)) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        decerement();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decerement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  Future<void> close() {
    internetStreamSubscription!.cancel();
    return super.close();
  }
}
