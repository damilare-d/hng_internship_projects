// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/api_service.dart';
import '../services/app_service.dart';
import '../services/cart_service_service.dart';
import '../services/checkout_service.dart';
import '../services/order_service.dart';
import '../services/product_detail_service.dart';
import '../services/wishlist_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ProductDetailService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => CartServiceService());
  locator.registerLazySingleton(() => CheckoutService());
  locator.registerLazySingleton(() => AppService());
  locator.registerLazySingleton(() => OrderService());
  locator.registerLazySingleton(() => WishlistService());
}
