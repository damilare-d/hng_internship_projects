import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';


class ProductsScreen extends StatelessWidget {
  final List<Product> products;
  final Function(Product) addToCheckout;

  ProductsScreen({required this.products, required this.addToCheckout});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text(products[index].name),
          subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
          trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: () => addToCheckout(products[index]),
          ),
        );
      },
    );
  }
}
