import 'package:flutter/material.dart';
import 'package:stage_3_hng_app/models/product_model.dart';
import 'package:stage_3_hng_app/app/app.locator.dart';
import 'package:stage_3_hng_app/services/cart_service_service.dart';
import 'package:stage_3_hng_app/services/product_detail_service.dart';

class CheckoutWidget extends StatelessWidget {
  final Product product;
  final int quantity;
  final String selectedColor;
  final String selectedSize;

  const CheckoutWidget({
    Key? key,
    required this.product,
    required this.quantity,
    required this.selectedColor,
    required this.selectedSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: (product.photos.isNotEmpty
                    ? NetworkImage(
                        "https://api.timbu.cloud/images/${product.photos[0].url}")
                    : Image.asset('assets/images/empty_img_placeholders.jpg'))
                as ImageProvider,
            height: 100,
            width: 100,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/empty_img_placeholders.jpg');
            },
          ),
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
                    Text(
                      '$quantity',
                      style: Theme.of(context).textTheme.labelMedium,
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
        ],
      ),
    );
  }
}
