import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tombu_shopping_app/models/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  final Product product;
  final bool expanded;
  final void Function() onTapIcon;

  const ProductItemWidget({
    required this.product,
    required this.expanded,
    required this.onTapIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: product.photos.isNotEmpty
                ? Image.network(
                    "https://api.timbu.cloud/images/${product.photos[0].url}",
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                          'assets/images/empty_img_placeholders.jpg');
                    },
                  )
                : Image.asset('assets/images/empty_img_placeholders.jpg'),
            title: Text(product.name),
            subtitle: Text('\$${product.currentPrice.toString()}'),
            trailing: IconButton(
              onPressed: onTapIcon,
              icon: const Icon(Icons.open_in_full),
            ),
          ),
          if (expanded)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
                Text('Description: ${product.description}'),
              ],
            ),
        ],
      ),
    );
  }
}
