import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_4_hng_app/app/app.locator.dart';
import 'package:stage_4_hng_app/services/app_service.dart';
import 'package:stage_4_hng_app/ui/views/all_products/all_products_view.dart';
import 'package:stage_4_hng_app/ui/views/order/orders_view.dart';

import '../cart/cart_view.dart';
import '../home/home_view.dart';

class DashboardViewModel extends ReactiveViewModel {
  final _appService = locator<AppService>();

  final List<Widget> dashboardOptions = [
    const HomeView(),
    const AllProductsView(),
    const CartView(),
    const OrdersView(),
    Container(
        color: Colors.purple, child: const Center(child: Text('Profile'))),
  ];

  int get selectedIndex => _appService.selectedIndex;
  void onItemTapped(int value) {
    _appService.onItemTapped(value);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_appService];
}
