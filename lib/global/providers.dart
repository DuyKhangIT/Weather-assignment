import 'package:huynh_duy_khang_home_assignment/core/view_models/screens/implements/connectivity_view_model.dart';
import 'package:huynh_duy_khang_home_assignment/core/view_models/screens/interfaces/iconnectivity_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../core/view_models/screens/implements/home_view_model.dart';
import '../core/view_models/screens/implements/splash_screen_view_model.dart';
import '../core/view_models/screens/interfaces/ihome_view_model.dart';
import '../core/view_models/screens/interfaces/isplash_screen_view_model.dart';

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider<ISplashScreenViewModel>(
    create: (_) => SplashScreenViewModel(),
  ),
  ChangeNotifierProvider<IConnectivityViewModel>(
    create: (_) => ConnectivityViewModel(),
  ),
  ChangeNotifierProvider<IHomeViewModel>(
    create: (_) => HomeViewModel(),
  ),
];
