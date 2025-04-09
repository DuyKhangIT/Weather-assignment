import 'package:flutter/material.dart';

import '../interfaces/iloading_screen_view_model.dart';

class LoadingScreenViewModel extends ChangeNotifier
    implements ILoadingScreenViewModel {
  @override
  Future<void> initData() async {
    notifyListeners();
  }
}
