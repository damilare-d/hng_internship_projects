import 'package:flutter/material.dart';
import 'package:stage_3_hng_app/models/product_model.dart';
import 'package:stage_3_hng_app/app/app.locator.dart';
import 'package:stage_3_hng_app/services/cart_service_service.dart';

class CartWidget extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback onRemove;
  final String selectedColor;
  final String selectedSize;

  const CartWidget({
    Key? key,
    required this.product,
    required this.quantity,
    required this.onRemove,
    required this.selectedColor,
    required this.selectedSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          product.photos.isNotEmpty
              ? Image.network(
                  "https://api.timbu.cloud/images/${product.photos[0].url}",
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                        'assets/images/empty_img_placeholders.jpg');
                  },
                )
              : Image.asset('assets/images/empty_img_placeholders.jpg'),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: 8.0),
                Text(
                  'Color: $selectedColor, Size: $selectedSize',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        // Decrease quantity
                        CartServiceService cartService =
                            locator<CartServiceService>();
                        cartService.decreaseQuantity(product);
                      },
                    ),
                    Text(
                      '$quantity',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        // Increase quantity
                        CartServiceService cartService =
                            locator<CartServiceService>();
                        cartService.increaseQuantity(product);
                      },
                    ),
                    const Spacer(),
                    Text(
                      '\$${(product.currentPrice ?? 0 * quantity).toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
