import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_4_hng_app/app/app.locator.dart';
import 'package:stage_4_hng_app/services/app_service.dart';

import '../cart/cart_view.dart';
import '../home/home_view.dart';

class DashboardViewModel extends ReactiveViewModel {
  final _appService = locator<AppService>();

  final List<Widget> dashboardOptions = [
    const HomeView(),
    Container(
        color: Colors.blue, child: const Center(child: Text('All Products'))),
    const CartView(),
    Container(
        color: Colors.yellow, child: const Center(child: Text('My Orders'))),
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
