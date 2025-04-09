import 'package:huynh_duy_khang_home_assignment/core/view_models/screens/implements/connectivity_view_model.dart';
import 'package:huynh_duy_khang_home_assignment/core/view_models/screens/interfaces/iconnectivity_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../core/view_models/screens/implements/weather_info_view_model.dart';
import '../core/view_models/screens/implements/loading_screen_view_model.dart';
import '../core/view_models/screens/interfaces/iweather_info_view_model.dart';
import '../core/view_models/screens/interfaces/iloading_screen_view_model.dart';

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider<ILoadingScreenViewModel>(
    create: (_) => LoadingScreenViewModel(),
  ),
  ChangeNotifierProvider<IConnectivityViewModel>(
    create: (_) => ConnectivityViewModel(),
  ),
  ChangeNotifierProvider<IWeatherInfoViewModel>(
    create: (_) => WeatherInfoViewModel(),
  ),
];
