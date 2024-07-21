import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_4_hng_app/ui/views/widgets/product_item_widget.dart';
import 'all_products_viewmodel.dart';
import 'package:stage_4_hng_app/models/product_model.dart';

class AllProductsView extends StackedView<AllProductsViewModel> {
  const AllProductsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AllProductsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: const Text('All Products')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: viewModel.products.isEmpty
            ? const Center(child: Text('No products available'))
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.6,
                ),
                itemCount: viewModel.products.length,
                itemBuilder: (context, index) {
                  final product = viewModel.products[index];
                  return ProductItem(
                    product: product,
                    onTap: () => viewModel.navigateToProductDetails(product),
                  );
                },
              ),
      ),
    );
  }

  @override
  AllProductsViewModel viewModelBuilder(BuildContext context) =>
      AllProductsViewModel();
}
