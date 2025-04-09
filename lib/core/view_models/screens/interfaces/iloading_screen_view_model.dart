import 'package:flutter/material.dart';

abstract class ILoadingScreenViewModel implements ChangeNotifier {
  Future<void> initData();
}
