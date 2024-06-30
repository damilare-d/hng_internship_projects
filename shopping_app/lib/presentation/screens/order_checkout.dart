import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Successful'),
      ),
      body: Center(
        child: Text(
          'Your order has been placed successfully!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
