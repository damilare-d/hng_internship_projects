import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_4_hng_app/models/product_model.dart';
import 'package:stage_4_hng_app/ui/views/cart/cart_viewmodel.dart';

import '../widgets/cart_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
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
                      selectedColor: selectedColor,
                      selectedSize: selectedSize,
                    );
                  },
                ),
              ),
              Padding(
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
                          '\$${model.getTotalPrice.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: model.onTapCheckOut,
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}