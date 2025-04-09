import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:huynh_duy_khang_home_assignment/core/view_models/screens/interfaces/iconnectivity_view_model.dart';
import 'package:provider/provider.dart';

import '../../../global/router.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IConnectivityViewModel>(
        builder: (_, viewModel, __) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(MyRouter.error);
                },
                child: Text('Error Screen'),
              )
            ],
          );
        },
      ),
    );
  }
}
