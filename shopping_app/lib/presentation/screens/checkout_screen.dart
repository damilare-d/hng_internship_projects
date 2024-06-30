import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/presentation/screens/order_checkout.dart';


class CheckoutScreen extends StatelessWidget {
  final List<Product> checkoutItems;
  final Function(Product) removeFromCheckout;

  CheckoutScreen({required this.checkoutItems, required this.removeFromCheckout});

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
                  onPressed: () => removeFromCheckout(checkoutItems[index]),
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
