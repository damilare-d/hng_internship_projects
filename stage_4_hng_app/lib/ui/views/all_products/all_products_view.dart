import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
            childAspectRatio: 0.7,
          ),
          itemCount: viewModel.products.length,
          itemBuilder: (context, index) {
            final product = viewModel.products[index];
            return _ProductItem(
              product: product,
              onTap: () => viewModel.navigateToProductDetails(product),
            );
          },
        ),
      ),
    );
  }

  @override
  AllProductsViewModel viewModelBuilder(BuildContext context) => AllProductsViewModel();
}

class _ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const _ProductItem({required this.product, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                'https://api.timbu.cloud/images/${product.photos.first.url}',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '\$${product.currentPrice}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
