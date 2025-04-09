import 'package:flutter/material.dart';

abstract class IConnectivityViewModel extends ChangeNotifier {
  bool get hasInternetConnection;
  void initFetchBackgroundConnectivity();
  void cancelFetchBackgroundConnectivity();
}
