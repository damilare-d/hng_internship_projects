// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i13;
import 'package:stage_4_hng_app/ui/views/all_products/all_products_view.dart'
    as _i11;
import 'package:stage_4_hng_app/ui/views/cart/cart_view.dart' as _i6;
import 'package:stage_4_hng_app/ui/views/checkout/checkout_view.dart' as _i7;
import 'package:stage_4_hng_app/ui/views/dashboard/dashboard_view.dart' as _i4;
import 'package:stage_4_hng_app/ui/views/home/home_view.dart' as _i2;
import 'package:stage_4_hng_app/ui/views/order/orders_view.dart' as _i9;
import 'package:stage_4_hng_app/ui/views/single_order/single_order_view.dart'
    as _i10;
import 'package:stage_4_hng_app/ui/views/single_product/single_product_view.dart'
    as _i5;
import 'package:stage_4_hng_app/ui/views/startup/startup_view.dart' as _i3;
import 'package:stage_4_hng_app/ui/views/success/success_view.dart' as _i8;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const dashboardView = '/dashboard-view';

  static const singleProductView = '/single-product-view';

  static const cartView = '/cart-view';

  static const checkoutView = '/checkout-view';

  static const successView = '/success-view';

  static const ordersView = '/orders-view';

  static const singleOrderView = '/single-order-view';

  static const allProductsView = '/all-products-view';

  static const all = <String>{
    homeView,
    startupView,
    dashboardView,
    singleProductView,
    cartView,
    checkoutView,
    successView,
    ordersView,
    singleOrderView,
    allProductsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i4.DashboardView,
    ),
    _i1.RouteDef(
      Routes.singleProductView,
      page: _i5.SingleProductView,
    ),
    _i1.RouteDef(
      Routes.cartView,
      page: _i6.CartView,
    ),
    _i1.RouteDef(
      Routes.checkoutView,
      page: _i7.CheckoutView,
    ),
    _i1.RouteDef(
      Routes.successView,
      page: _i8.SuccessView,
    ),
    _i1.RouteDef(
      Routes.ordersView,
      page: _i9.OrdersView,
    ),
    _i1.RouteDef(
      Routes.singleOrderView,
      page: _i10.SingleOrderView,
    ),
    _i1.RouteDef(
      Routes.allProductsView,
      page: _i11.AllProductsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.DashboardView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.DashboardView(),
        settings: data,
      );
    },
    _i5.SingleProductView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SingleProductView(),
        settings: data,
      );
    },
    _i6.CartView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.CartView(),
        settings: data,
      );
    },
    _i7.CheckoutView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.CheckoutView(),
        settings: data,
      );
    },
    _i8.SuccessView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.SuccessView(),
        settings: data,
      );
    },
    _i9.OrdersView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.OrdersView(),
        settings: data,
      );
    },
    _i10.SingleOrderView: (data) {
      final args = data.getArgs<SingleOrderViewArguments>(nullOk: false);
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.SingleOrderView(key: args.key, orderIndex: args.orderIndex),
        settings: data,
      );
    },
    _i11.AllProductsView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.AllProductsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class SingleOrderViewArguments {
  const SingleOrderViewArguments({
    this.key,
    required this.orderIndex,
  });

  final _i12.Key? key;

  final int orderIndex;

  @override
  String toString() {
    return '{"key": "$key", "orderIndex": "$orderIndex"}';
  }

  @override
  bool operator ==(covariant SingleOrderViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.orderIndex == orderIndex;
  }

  @override
  int get hashCode {
    return key.hashCode ^ orderIndex.hashCode;
  }
}

extension NavigatorStateExtension on _i13.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSingleProductView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.singleProductView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCheckoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.checkoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuccessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.successView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrdersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.ordersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSingleOrderView({
    _i12.Key? key,
    required int orderIndex,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.singleOrderView,
        arguments: SingleOrderViewArguments(key: key, orderIndex: orderIndex),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAllProductsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.allProductsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSingleProductView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.singleProductView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCheckoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.checkoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSuccessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.successView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrdersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.ordersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSingleOrderView({
    _i12.Key? key,
    required int orderIndex,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.singleOrderView,
        arguments: SingleOrderViewArguments(key: key, orderIndex: orderIndex),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAllProductsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.allProductsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
