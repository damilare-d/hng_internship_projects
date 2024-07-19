import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';

class ProductsScreen extends StatefulWidget {
  final List<Product> products;
  final Function(Product) addToCheckout;

  ProductsScreen({required this.products, required this.addToCheckout});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void _addNewProduct(String name, double price) {
    setState(() {
      widget.products.add(Product(
        id: DateTime.now().toString(),
        name: name,
        price: price,
      ));
    });
  }

  void _showAddProductSheet(BuildContext context) {
    final nameController = TextEditingController();
    final priceController = TextEditingController();

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Product Name'),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Product Price'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Add Product'),
                  onPressed: () {
                    final name = nameController.text;
                    final price = double.parse(priceController.text);
                    _addNewProduct(name, price);
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(widget.products[index].name),
            subtitle:
                Text('\$${widget.products[index].price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => widget.addToCheckout(widget.products[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddProductSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
