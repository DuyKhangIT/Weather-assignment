import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huynh_duy_khang_home_assignment/utils/color_utils.dart';

import '../ui/common/loading_widget.dart';

class LoadingUtils {
  static Future<void> showLoading() async {
    showDialog(
      barrierColor: ColorUtils.background,
      context: Get.context!,
      barrierDismissible: false,
      builder: (_) => const LoadingWidget(),
    );
  }

  static void hideLoading() {
    Get.back();
  }
}
