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
  await generateMockData();
}

void setupRestClient({
  String? bearerAuthToken,
}) {
  var dio = Dio();
  var dioWithReceiveTimeOut = Dio();
  dio.options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 300000),
      receiveTimeout:
          const Duration(milliseconds: 0), // [0] meanings no timeout limit
      headers: {
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive'
      });
  dioWithReceiveTimeOut.options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 15000),
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

Future generateMockData() async {
  // account
  // var lstUser = {'1111', '2222', '3333', '444'}
  //     .map(
  //       (e) => new AccountDto(
  //         login: e,
  //         pin: e.generateMd5(),
  //         email: e + '@gmail.com',
  //         firstName: e,
  //         lastName: e,
  //       ),
  //     )
  //     .toList();
  // AccountService accountService = new AccountService();
  // await accountService.saveUsers(lstUser);

  // location
  // [
  //   LocationEntity(name: "1st class", code: "123", countryId: "1"),
  //   LocationEntity(name: "Cafe Bar", code: "123", countryId: "2"),
  //   LocationEntity(name: "Trolley", code: "123", countryId: "3"),
  // ].forEach((x) {
  //   locator<LocationDao>().insertLocation(x);
  // });
  // departure
  // [
  //   DepartureEntity(
  //     code: "1YOO",
  //     description: "York - Kings Cross",
  //     routeId: "123",
  //     vehicleId: "123",
  //     departureTime: DateTime.parse("2021-04-20 04:40:04Z"),
  //     arrivalTime: DateTime.parse("2021-04-20 07:40:04Z"),
  //   ),
  //   DepartureEntity(
  //     code: "1A01",
  //     description: "Leeds - Kings Cross",
  //     routeId: "123",
  //     vehicleId: "123",
  //     departureTime: DateTime.parse("2021-04-20 05:40:04Z"),
  //     arrivalTime: DateTime.parse("2021-04-20 09:40:04Z"),
  //   ),
  //   DepartureEntity(
  //     code: "1Y05",
  //     description: "New Castle - Kings Cross",
  //     routeId: "123",
  //     vehicleId: "123",
  //     departureTime: DateTime.parse("2021-04-20 05:40:04Z"),
  //     arrivalTime: DateTime.parse("2021-04-20 09:40:04Z"),
  //   ),
  //   DepartureEntity(
  //     code: "1D01",
  //     description: "Kings Cross - Leeds",
  //     routeId: "123",
  //     vehicleId: "123",
  //     departureTime: DateTime.parse("2021-04-20 06:40:04Z"),
  //     arrivalTime: DateTime.parse("2021-04-20 09:40:04Z"),
  //   ),
  //   DepartureEntity(
  //     code: "1A04",
  //     description: "Leeds - Kings Cross",
  //     routeId: "123",
  //     vehicleId: "123",
  //     departureTime: DateTime.parse("2021-04-20 05:40:04Z"),
  //     arrivalTime: DateTime.parse("2021-04-20 09:40:04Z"),
  //   ),
  //   DepartureEntity(
  //     code: "1YOO",
  //     description: "York - Kings Cross",
  //     routeId: "123",
  //     vehicleId: "123",
  //     departureTime: DateTime.parse("2021-04-20 04:40:04Z"),
  //     arrivalTime: DateTime.parse("2021-04-20 07:40:04Z"),
  //   ),
  //   DepartureEntity(
  //     code: "1A01",
  //     description: "Leeds - Kings Cross",
  //     routeId: "123",
  //     vehicleId: "123",
  //     departureTime: DateTime.parse("2021-04-20 05:40:04Z"),
  //     arrivalTime: DateTime.parse("2021-04-20 09:40:04Z"),
  //   ),
  //   DepartureEntity(
  //     code: "1Y05",
  //     description: "New Castle - Kings Cross",
  //     routeId: "123",
  //     vehicleId: "123",
  //     departureTime: DateTime.parse("2021-04-20 05:40:04Z"),
  //     arrivalTime: DateTime.parse("2021-04-20 09:40:04Z"),
  //   ),
  //   DepartureEntity(
  //     code: "1D01",
  //     description: "Kings Cross - Leeds",
  //     routeId: "123",
  //     vehicleId: "123",
  //     departureTime: DateTime.parse("2021-04-20 06:40:04Z"),
  //     arrivalTime: DateTime.parse("2021-04-20 09:40:04Z"),
  //   ),
  //   DepartureEntity(
  //     code: "1A04",
  //     description: "Leeds - Kings Cross",
  //     routeId: "123",
  //     vehicleId: "123",
  //     departureTime: DateTime.parse("2021-04-20 05:40:04Z"),
  //     arrivalTime: DateTime.parse("2021-04-20 09:40:04Z"),
  //   ),
  // ].forEach((x) {
  //   locator<DepartureDao>().insertDeparture(x);
  // });
// vehicle

  // screen layout
  // [
  //   ScreenLayoutEntity(name: "Mains", functionCustomisation: ""),
  //   ScreenLayoutEntity(name: "Hot drinks", order: 2),
  //   ScreenLayoutEntity(name: "Alcohol", order: 3),
  //   ScreenLayoutEntity(name: "Soft drinks", order: 4),
  //   ScreenLayoutEntity(name: "Hot food", order: 5),
  //   ScreenLayoutEntity(name: "Confectionary", order: 6),
  // ].forEach((x) {
  //   locator<ScreenLayoutDao>().insertScreenLayout(x);
  // });

  // card transaction
  // var lstTransaction = {10.0, 20.0, 30.0, 40.0}
  //     .map(
  //       (e) => new TransactionDto(
  //         id: Uuid().v4(),
  //         createTime: DateTime.parse("2021-04-20 05:40:04Z"),
  //         transactionnumber: "0123456",
  //         amount: e,
  //         currencyCode: "Cash",
  //         currencySymbol: "\$",
  //         creatorName: "tuandiep",
  //         creatorId: Uuid().v4(),
  //         transactionDetails: [20.0, 40.0, 60.0, 20.0, 10.0, 50.0]
  //             .map(
  //               (transactionDetail) => new CreateTransactionDetailDto(
  //                 id: Uuid().v4(),
  //                 price: transactionDetail,
  //                 quantity: 1,
  //                 tax: 5.0,
  //                 productId: '123',
  //               ),
  //             )
  //             .toList(),
  //       ),
  //     )
  //     .toList();
  // TransactionService transactionService = new TransactionService();
  // await transactionService.saveTransactions(lstTransaction);
  // product screen
  // [
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 1),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 1),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 1),
  //   ProductEntity(
  //       code: "123",
  //       name: "Coca Cola",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 1),
  //   ProductEntity(
  //       code: "123",
  //       name: "Coca Cola Zero",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 1),
  //   ProductEntity(
  //       code: "123",
  //       name: "Still Water",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 1),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 2),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 2),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 2),
  //   ProductEntity(
  //       code: "123",
  //       name: "Coca Cola",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 2),
  //   ProductEntity(
  //       code: "123",
  //       name: "Coca Cola Zero",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 2),
  //   ProductEntity(
  //       code: "123",
  //       name: "Still Water",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 2),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 3),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 3),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 3),
  //   ProductEntity(
  //       code: "123",
  //       name: "Coca Cola",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 3),
  //   ProductEntity(
  //       code: "123",
  //       name: "Coca Cola Zero",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 3),
  //   ProductEntity(
  //       code: "123",
  //       name: "Still Water",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 3),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 4),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 4),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 4),
  //   ProductEntity(
  //       code: "123",
  //       name: "Coca Cola",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 4),
  //   ProductEntity(
  //       code: "123",
  //       name: "Coca Cola Zero",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 4),
  //   ProductEntity(
  //       code: "123",
  //       name: "Still Water",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 4),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 5),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 5),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 5),
  //   ProductEntity(
  //       code: "123",
  //       name: "Coca Cola",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 5),
  //   ProductEntity(
  //       code: "123",
  //       name: "Coca Cola Zero",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 5),
  //   ProductEntity(
  //       code: "123",
  //       name: "Still Water",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 5),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 6),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 6),
  //   ProductEntity(
  //       code: "123",
  //       name: "Chicken Salad",
  //       image: "",
  //       price: 7.50,
  //       productGroupID: 6),
  //   ProductEntity(
  //       code: "123",
  //       name: "Coca Cola",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 6),
  //   ProductEntity(
  //       code: "123",
  //       name: "Coca Cola Zero",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 6),
  //   ProductEntity(
  //       code: "123",
  //       name: "Still Water",
  //       image: "",
  //       price: 2.50,
  //       productGroupID: 6),
  // ].forEach((x) {
  //   locator<ProductDao>().insertProduct(x);
  // });

  // [
  //   SupplierLocationEntity(code: "123", name: "Supplier location 1", image: ""),
  //   SupplierLocationEntity(code: "123", name: "Supplier location 2", image: ""),
  //   SupplierLocationEntity(code: "123", name: "Supplier location 3", image: ""),
  //   SupplierLocationEntity(code: "123", name: "Supplier location 4", image: ""),
  //   SupplierLocationEntity(
  //     code: "123",
  //     name: "Supplier location 5",
  //   ),
  //   SupplierLocationEntity(
  //     code: "123",
  //     name: "Supplier location 6",
  //   ),
  // ].forEach((x) {
  //   locator<SupplierLocationDao>().insertSupplierLoction(x);
  // });

  // [
  //   SessionStaffEntity(
  //       id: Uuid().v4(),
  //       code: '123-123-123-123',
  //       status: 'open',
  //       members: [
  //         AccountEntity(
  //           firstName: 'test 3',
  //           email: 'esadasasdd',
  //           login: '3333',
  //           pin: '3333'.generateMd5(),
  //           id: Uuid().v4(),
  //           userType: EnumHelper.getValue(EnumMap.userType, UserType.both),
  //         ),
  //         AccountEntity(
  //           firstName: 'test 3',
  //           email: 'esadasasdd',
  //           login: '3333',
  //           pin: '3333'.generateMd5(),
  //           id: Uuid().v4(),
  //           userType: EnumHelper.getValue(EnumMap.userType, UserType.both),
  //         ),
  //       ])
  // ].forEach((x) async {
  //   await locator<SessionStaffDao>().insertSessionStaff(x);
  // });
  //Table group

  // [
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola", stockGroupID: 1),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola Zero", stockGroupID: 1),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Water", stockGroupID: 1),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola", stockGroupID: 1),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola Zero", stockGroupID: 1),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Water", stockGroupID: 1),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola", stockGroupID: 1),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola", stockGroupID: 2),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola Zero", stockGroupID: 2),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Water", stockGroupID: 2),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola", stockGroupID: 2),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola Zero", stockGroupID: 2),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Water", stockGroupID: 2),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola", stockGroupID: 2),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola", stockGroupID: 3),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola Zero", stockGroupID: 3),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Water", stockGroupID: 3),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola", stockGroupID: 3),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola Zero", stockGroupID: 3),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Water", stockGroupID: 3),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola", stockGroupID: 3),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola", stockGroupID: 4),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola Zero", stockGroupID: 4),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Water", stockGroupID: 4),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola", stockGroupID: 4),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola Zero", stockGroupID: 4),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Water", stockGroupID: 4),
  //   ProductStockGroupEntity(
  //       image: "", code: "123", name: "Coca Cola", stockGroupID: 4),
  // ].forEach((x) {
  //   locator<ProductStockGroupDao>().insert(x);
  // });
}
