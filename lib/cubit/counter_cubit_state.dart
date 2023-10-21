part of 'counter_cubit_cubit.dart';

final class CounterState {
  int counterValue;
  bool? wasIncremented;
  CounterState({
    this.wasIncremented,
    required this.counterValue,
  });
}
