import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../interfaces/iconnectivity_view_model.dart';

class ConnectivityViewModel extends ChangeNotifier
    implements IConnectivityViewModel {
  bool _hasInternetConnection = false;
  Timer? _connectionCheckTimer;

  @override
  bool get hasInternetConnection => _hasInternetConnection;

  @override
  void initFetchBackgroundConnectivity() {
    // Initial check
    _checkConnection();

    // Set up periodic checking every 10 seconds
    _connectionCheckTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      _checkConnection();
    });
  }

  Future<void> _checkConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    if (_hasInternetConnection != isConnected) {
      _hasInternetConnection = isConnected;
      notifyListeners();
    }
  }

  @override
  void cancelFetchBackgroundConnectivity() {
    _connectionCheckTimer?.cancel();
    _connectionCheckTimer = null;
  }
}
