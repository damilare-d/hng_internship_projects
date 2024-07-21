import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_4_hng_app/ui/views/widgets/empty_order_widget.dart';
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
          body: viewModel.orders.isEmpty ?
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: EmptyOrderWidget(),
          ):
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: viewModel.orders.length,
              itemBuilder: (context, index) {
                final order = viewModel.orders[index];
                return ListTile(
                  leading:  Image(
                    image: (order['product'].photos.isNotEmpty
                        ? NetworkImage(
                        "https://api.timbu.cloud/images/${order['product'].photos[0].url}")
                        : Image.asset(
                        'assets/images/empty_img_placeholders.jpg'))
                    as ImageProvider,
                    height: 100,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                          'assets/images/empty_img_placeholders.jpg');
                    },
                  ),
                  title: Text(order['product'].name),
                  subtitle: Text('Quantity: ${order['quantity']}'),
                  onTap: () => viewModel.navigateToOrderDetails(index),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
