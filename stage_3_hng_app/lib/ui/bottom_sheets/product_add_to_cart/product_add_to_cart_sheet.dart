import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_3_hng_app/ui/bottom_sheets/product_add_to_cart/product_add_to_cart_sheet_model.dart';


class ProductAddToCartSheet extends StackedView<ProductAddToCartSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  const ProductAddToCartSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      ProductAddToCartSheetModel viewModel,
      Widget? child,
      ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Product Added to Cart',
            //style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 10),
          Text(
            request.description ?? 'The product has been added to your cart.',
           // style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }

  @override
  ProductAddToCartSheetModel viewModelBuilder(BuildContext context) =>
      ProductAddToCartSheetModel();
}
