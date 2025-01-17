import 'package:flutter/material.dart';
import 'package:stage_3_hng_app/app/app.locator.dart';
import 'package:stage_3_hng_app/models/product_model.dart';
import 'package:stage_3_hng_app/services/cart_service_service.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final String? imageUrl;
  final String? price;
  final String? name;
  final VoidCallback onAddToCart;
  final VoidCallback onTap;
  final cartService = locator<CartServiceService>();

  ProductItem({
    Key? key,
    this.imageUrl,
    this.price,
    this.name,
    required this.onAddToCart,
    required this.onTap,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 168,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Image(
              image: (product.photos.isNotEmpty
                      ? NetworkImage(
                          "https://api.timbu.cloud/images/${product.photos[0].url}")
                      : Image.asset('assets/images/empty_img_placeholders.jpg'))
                  as ImageProvider,
              height: 180,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/empty_img_placeholders.jpg');
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            product.currentPrice.toString(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: const Color(0xFF0072C6),
                ),
          ),
          ElevatedButton(
            onPressed: () {
              cartService.addToCart(product);
              cartService.showProductAddedToCartBottomSheet();
              onAddToCart();
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
