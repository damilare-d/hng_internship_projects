import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_4_hng_app/models/product_model.dart';
import 'package:stage_4_hng_app/ui/views/widgets/checkout_widget.dart';
import 'checkout_viewmodel.dart';

class CheckoutView extends StackedView<CheckoutViewModel> {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CheckoutViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.checkoutItems.length,
                itemBuilder: (context, index) {
                  var item = viewModel.checkoutItems[index];
                  Product product = item['product'];
                  int quantity = item['quantity'];
                  String selectedColor = item['selectedColor'];
                  String selectedSize = item['selectedSize'];
                  return CheckoutWidget(
                    product: product,
                    quantity: quantity,
                    selectedColor: selectedColor,
                    selectedSize: selectedSize,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: viewModel.cancel, child: const Text("Cancel")),
                  ElevatedButton(
                    onPressed: viewModel.showPaymentSheet,
                    child: const Text('Proceed'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CheckoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CheckoutViewModel();
}
