// lib/ui/widgets/product_list_item.dart
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tombu_shopping_app/models/product_model.dart';
import 'product_item_viewmodel.dart';

class ProductItemView extends StackedView<ProductItemViewModel> {
  final Product product;
  final bool expanded;

  const ProductItemView(this.product, this.expanded, {super.key});

  @override
  Widget builder(
    BuildContext context,
    ProductItemViewModel viewModel,
    Widget? child,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: product.photos != null && product.photos!.isNotEmpty
                ? Image.network(
                    product.photos!.first['url'],
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('tombu_shopping_app/assets/images/empty_img_placeholders.jpg');
                    },
                  )
                : Image.asset('tombu_shopping_app/assets/images/empty_img_placeholders.jpg'),
            title: Text(product.name ?? "No name available"),
            subtitle: Text(
                '₦${product.currentPrice != null ? product.currentPrice[0]['NGN'][0].toString() : 'No price available'}'),
          ),
          if (expanded)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
                Text(
                    'Description: ${product.description ?? 'No description available'}'),
              ],
            ),
        ],
      ),
    );
  }

  @override
  ProductItemViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductItemViewModel();
}
