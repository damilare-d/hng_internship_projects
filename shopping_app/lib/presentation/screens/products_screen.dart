import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<Product> products = [
    Product(id: '1', name: 'Product 1', price: 10.0),
    Product(id: '2', name: 'Product 2', price: 20.0),
    // Add more products here
  ];

  var checkoutItems;

  void _addToCheckout(Product product) {
    setState(() {
      checkoutItems.add(product);
    });
  }

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
            onPressed: () => _addToCheckout(products[index]),
          ),
        );
      },
    );
  }
}
