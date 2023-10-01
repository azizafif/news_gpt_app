import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectivityHandler {
  static final _connectivity = Connectivity();

  static final ValueNotifier<bool> _isConnectedValueNotifier = ValueNotifier(false);

  static ValueNotifier<bool> get isConnectedValueNotifier {
    assert(
      _monitoring,
      '\n[ConnectivityManager] You have forgot to start monitoring, try to do it by calling  ConnectivityHandler.startMonitoring()',
    );
    return _isConnectedValueNotifier;
  }

  static bool _monitoring = false;

  static void startMonitoring() {
    if (_monitoring) return;

    _monitoring = true;

    _connectivity.onConnectivityChanged.listen((connectivityResult) {
      _isConnectedValueNotifier.value = !_isConnectedValueNotifier.value;
      _isConnectedValueNotifier.value = connectivityResult != ConnectivityResult.none;
    });
  }
}
