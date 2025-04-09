import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/common/loading_widget.dart';

Future<void> showLoading() async {
  showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (_) => const LoadingWidget(),
  );
}

void hideLoading(BuildContext context) {
  Get.back();
}
