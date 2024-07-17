import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_3_hng_app/app/app.locator.dart';
import 'package:stage_3_hng_app/services/app_service.dart';

import '../cart/cart_view.dart';
import '../home/home_view.dart';

class DashboardViewModel extends ReactiveViewModel {
  final _appService = locator<AppService>();

  final List<Widget> dashboardOptions = [
    const HomeView(),
    Container(color: Colors.blue, child: Center(child: Text('All Products'))),
    CartView(),
    Container(color: Colors.yellow, child: Center(child: Text('My Orders'))),
    Container(color: Colors.purple, child: Center(child: Text('Profile'))),
  ];

  int get selectedIndex => _appService.selectedIndex;
  void Function(int value) get onItemTapped => _appService.onItemTapped;
}
