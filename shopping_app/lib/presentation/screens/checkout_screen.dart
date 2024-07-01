import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/presentation/screens/order_checkout.dart';


class CheckoutScreen extends StatefulWidget {
  final List<Product> checkoutItems;
  final Function(Product) removeFromCheckout;

  CheckoutScreen({required this.checkoutItems, required this.removeFromCheckout});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  void _clearCheckout() {
    setState(() {
      widget.checkoutItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.checkoutItems.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(widget.checkoutItems[index].name),
                subtitle: Text('\$${widget.checkoutItems[index].price.toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => widget.removeFromCheckout(widget.checkoutItems[index]),
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          child: Text('Place Order'),
          onPressed: () {
            _clearCheckout();
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
