import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String name;
  final VoidCallback onAddToCart;
  final VoidCallback onTap;

  const ProductItem({
    Key? key,
    required this.imageUrl,
    required this.price,
    required this.name,
    required this.onAddToCart, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      // width: 168,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
                height: 150,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              price,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: const Color(0xFF0072C6),
                  ),
            ),
            ElevatedButton(
              onPressed: onAddToCart,
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
