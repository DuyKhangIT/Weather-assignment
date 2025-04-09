import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:huynh_duy_khang_home_assignment/utils/color_utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global/locator.dart';
import 'global/my_router_observer.dart';
import 'global/providers.dart';
import 'global/router.dart';

void main() {
  mainDelegate();
  runApp(const MyApp());
}

late SharedPreferences sharedPreferences;

Future<void> mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...viewModelProviders],
      child: Builder(
        builder: (BuildContext context) {
          return GetMaterialApp(
            title: 'Weather App',
            navigatorKey: GlobalKey<NavigatorState>(),
            onGenerateRoute: (settings) => MyRouter.generateRoute(settings),
            navigatorObservers: [MyRouteObserver()],
            initialRoute: MyRouter.weatherInfo,
            theme: ThemeData(
              fontFamily: 'Roboto',
              primarySwatch: Colors.red,
              scaffoldBackgroundColor: ColorUtils.background,
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.dark,
              ),
            ),
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
