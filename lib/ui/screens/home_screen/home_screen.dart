import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/view_models/screens/interfaces/ihome_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IHomeViewModel>(
      builder: (_, viewModel, __) {
        return Scaffold(
          body: Text('Home Screen'),
        );
      },
    );
  }
}
