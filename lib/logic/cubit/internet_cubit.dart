// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter_application_1/constants/enum.dart';
// import 'package:meta/meta.dart';

// part 'internet_state.dart';

// class InternetCubit extends Cubit<InternetState> {
//   final Connectivity connectivity;
//   late StreamSubscription connectivityStreamSubscription;
//   InternetCubit(this.connectivity) : super(InternetLoading()) {
//     connectivityStreamSubscription =
//         connectivity.onConnectivityChanged.listen((connectivityResult) {
//       if (connectivityResult == ConnectivityResult.wifi) {
//         emitInternetConnected(ConnectionType.Wifi);
//       } else if (connectivityResult == ConnectivityResult.mobile) {
//         emitInternetConnected(ConnectionType.Mobile);
//       } else if (connectivityResult == ConnectivityResult.none) {
//         emitInternetDisconnected();
//       }
//     });
//   }
//   void emitInternetConnected(ConnectionType connectionType) =>
//       emit(InternetConnected(connectionType: connectionType));

//   void emitInternetDisconnected() => emit(InternetDisconnected());

//   @override
//   Future<void> close() {
//     connectivityStreamSubscription.cancel();
//     return super.close();
//   }
// }
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_application_1/constants/enum.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;
  InternetCubit(this.connectivity) : super(InternetLoading()) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.Wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.Mobile);
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
