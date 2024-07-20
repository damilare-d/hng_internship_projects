import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'single_order_viewmodel.dart';

class SingleOrderView extends StatelessWidget {
  final int orderIndex;

  const SingleOrderView({Key? key, required this.orderIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SingleOrderViewModel>.reactive(
      viewModelBuilder: () => SingleOrderViewModel(orderIndex),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Order Details')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: (viewModel.product.photos.isNotEmpty
                      ? NetworkImage(
                      "https://api.timbu.cloud/images/${viewModel.product.photos[0].url}")
                      : Image.asset(
                      'assets/images/empty_img_placeholders.jpg'))
                  as ImageProvider,
                  height: 180,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                        'assets/images/empty_img_placeholders.jpg');
                  },
                ),
                const SizedBox(height: 16,),
                Text('Product: ${viewModel.product.name}',
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text('Quantity: ${viewModel.quantity}',
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text('Color: ${viewModel.selectedColor}',
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text('Size: ${viewModel.selectedSize}',
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
          ),
        );
      },
    );
  }
}
