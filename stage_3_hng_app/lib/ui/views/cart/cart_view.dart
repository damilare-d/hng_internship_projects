import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_3_hng_app/models/product_model.dart';
import 'package:stage_3_hng_app/app/app.locator.dart';
import 'package:stage_3_hng_app/services/cart_service_service.dart';

import '../widgets/cart_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartServiceService>.reactive(
      viewModelBuilder: () => locator<CartServiceService>(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: ListView.builder(
          itemCount: model.cartItems.length,
          itemBuilder: (context, index) {
            var item = model.cartItems[index];
            Product product = item['product'];
            int quantity = item['quantity'];
            String selectedColor = item['selectedColor'];
            String selectedSize = item['selectedSize'];
            return CartWidget(
              product: product,
              quantity: quantity,
              onRemove: () {
                model.removeFromCart(product);
              },
              selectedColor: selectedColor,
              selectedSize: selectedSize,
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    '\$${model.getTotalPrice().toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle checkout
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}