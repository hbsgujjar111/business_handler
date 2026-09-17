import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/legacy.dart';

final internetConnectionProvider = StateNotifierProvider<ConnectivityStateNotifier, bool>(
  (ref) => ConnectivityStateNotifier(),
);

class ConnectivityStateNotifier extends StateNotifier<bool> {
  ConnectivityStateNotifier() : super(true) {
    _startListening();
  }

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool _previousState = true;

  /// Start listening to connectivity changes
  void _startListening() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// Update the connectivity state based on the stream
  void _updateConnectionStatus(List<ConnectivityResult> connectivityResult) {
    bool currentState = false;
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet) ||
        connectivityResult.contains(ConnectivityResult.vpn) ||
        connectivityResult.contains(ConnectivityResult.bluetooth) ||
        connectivityResult.contains(ConnectivityResult.other)) {
      currentState = true;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      currentState = false;
    }

    /// Only update state if the connectivity status has changed
    if (currentState != _previousState) {
      state = currentState;
      _previousState = currentState;
    }
  }

  /// Dispose the subscription when the notifier is no longer needed
  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
