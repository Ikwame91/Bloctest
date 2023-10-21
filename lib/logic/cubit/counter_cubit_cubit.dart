import 'package:bloc/bloc.dart';

part 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decerement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}
