import 'package:bloc/bloc.dart';

part 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}
// class CounterCubit extends Cubit<CounterState> {
//   // final InternetCubit internetCubit;
//   // late StreamSubscription internetStreamSubscription;
//   CounterCubit() : super(CounterState(counterValue: 0)) {
//     // internetStreamSubscription = internetCubit.stream.listen((internetState) {
//       // if (internetState is InternetConnected &&
//       //     internetState.connectionType == ConnectionType.Wifi) {
//       //   increment();
//       // } else if (internetState is InternetConnected &&
//       //     internetState.connectionType == ConnectionType.Mobile) {
//       //   decerement();
//       // }
//     }
//   }

//   void increment() => emit(
//       CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
//   void decerement() => emit(CounterState(
//       counterValue: state.counterValue - 1, wasIncremented: false));

 

