import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';

import 'order_checkout.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  var checkoutItems;

  void _removeFromCheckout(Product product) {
    setState(() {
      checkoutItems.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: checkoutItems.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(checkoutItems[index].name),
                subtitle: Text('\$${checkoutItems[index].price.toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => _removeFromCheckout(checkoutItems[index]),
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          child: Text('Place Order'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OrderSuccessScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
