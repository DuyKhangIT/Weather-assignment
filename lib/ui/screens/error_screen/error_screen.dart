import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:huynh_duy_khang_home_assignment/utils/color_utils.dart';

import '../../../global/router.dart';
import '../../../utils/loading_utils.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.errorBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 52),
            child: Text(
              'Something went wrong at our end!',
              textAlign: TextAlign.justify,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                height: 1.2,
                fontWeight: FontWeight.w100,
                fontSize: 54,
                color: Colors.white,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              LoadingUtils.showLoading();
              Future.delayed(const Duration(seconds: 1), () {
                LoadingUtils.hideLoading();
              });
            },
            child: Container(
              width: 100,
              height: 45,
              margin: const EdgeInsets.only(top: 44),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorUtils.greyButton,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Retry'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
