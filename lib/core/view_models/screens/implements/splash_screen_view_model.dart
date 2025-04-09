import 'package:flutter/material.dart';

import '../interfaces/isplash_screen_view_model.dart';

class SplashScreenViewModel extends ChangeNotifier
    implements ISplashScreenViewModel {
  @override
  Future<void> initData() async {
    notifyListeners();
  }
}
