import 'package:flutter/material.dart';
import 'package:tombu_shopping_app/models/product_model.dart';

class ProductView extends StatelessWidget {
  final Product product;

  const ProductView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name ?? 'Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: product.photos.isNotEmpty
                  ? Image.network(
                     "https://api.timbu.cloud/images/${product.photos[0].url}",
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                            'assets/images/empty_img_placeholders.jpg');
                      },
                    )
                  : Image.asset('assets/images/empty_img_placeholders.jpg'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Name: ${product.name}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Available Quantity: ${product.availableQuantity ?? 'N/A'}',
            ),
            const SizedBox(height: 8.0),
            Text(
              'Description: ${product.description ?? 'No description available'}',
            ),
            const SizedBox(height: 8.0),
            Text(
              'Date Created: ${product.dateCreated}',
            ),
            const SizedBox(height: 8.0),
            Text(
              'Buying Price: ${product.buyingPrice ?? 'N/A'}',
            ),
            const SizedBox(height: 8.0),
            Text(
              'Selling Price: ${product.sellingPrice ?? 'N/A'}',
            ),
          ],
        ),
      ),
    );
  }
}
