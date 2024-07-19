import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/presentation/screens/checkout_screen.dart';
import 'package:shopping_app/presentation/screens/products_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Product> checkoutItems = [];

  final List<Product> products = [
    Product(id: '1', name: 'Product 1', price: 10.0),
    Product(id: '2', name: 'Product 2', price: 20.0),
    // Add more products here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addToCheckout(Product product) {
    setState(() {
      checkoutItems.add(product);
    });
  }

  void _removeFromCheckout(Product product) {
    setState(() {
      checkoutItems.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      ProductsScreen(products: products, addToCheckout: _addToCheckout),
      CheckoutScreen(
          checkoutItems: checkoutItems,
          removeFromCheckout: _removeFromCheckout),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Checkout',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
