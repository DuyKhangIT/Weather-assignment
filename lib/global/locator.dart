import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import '../core/api/api_interceptor.dart';
import '../core/api/rest_client.dart';
import 'global_data.dart';
import 'locator_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => GlobalData());

  setupRestClient();
  registerServiceSingletons(locator);
}

void setupRestClient({
  String? bearerAuthToken,
}) {
  var dio = Dio();
  dio.options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 300000),
      receiveTimeout:
          const Duration(milliseconds: 0), // [0] meanings no timeout limit
      headers: {
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive'
      });

  dio.interceptors.addAll([
    ApiLogInterceptor(),
  ]);

  if (locator.isRegistered<RestClient>(instanceName: 'RestClient')) {
    locator.unregister<RestClient>(instanceName: 'RestClient');
  }

  try {
    locator.registerLazySingleton(
      () => RestClient(dio, baseUrl: 'https://api.openweathermap.org/'),
      instanceName: 'RestClient',
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}

RestClient getRestClient() {
  return locator.get<RestClient>(instanceName: 'RestClient');
}
