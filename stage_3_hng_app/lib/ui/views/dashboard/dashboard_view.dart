import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_3_hng_app/ui/views/home/home_view.dart';

import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: IndexedStack(
        index: viewModel.currentIndex,
        children: [
          HomeView(),
          // Add other views here, e.g., AllProductsView(), CartView(), etc.
          Container(
              color: Colors.blue, child: Center(child: Text('All Products'))),
          Container(color: Colors.green, child: Center(child: Text('Cart'))),
          Container(
              color: Colors.yellow, child: Center(child: Text('My Orders'))),
          Container(
              color: Colors.purple, child: Center(child: Text('Profile'))),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xff0072C6),
        unselectedItemColor: Colors.grey,
        currentIndex: viewModel.currentIndex,
        onTap: (index) => viewModel.setIndex(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
