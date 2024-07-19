import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'orders_viewmodel.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrdersViewModel>.reactive(
      viewModelBuilder: () => OrdersViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Orders')),
          body: ListView.builder(
            itemCount: viewModel.orders.length,
            itemBuilder: (context, index) {
              final order = viewModel.orders[index];
              return ListTile(
                title: Text(order['product'].name),
                subtitle: Text('Quantity: ${order['quantity']}'),
                onTap: () => viewModel.navigateToOrderDetails(index),
              );
            },
          ),
        );
      },
    );
  }
}
