import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tombu_shopping_app/ui/views/product_item/product_item_view.dart';

import 'product_list_viewmodel.dart';

class ProductListView extends StackedView<ProductListViewModel> {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductListViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : viewModel.hasError
              ? Center(child: Text('Error: ${viewModel.modelError}'))
              : ListView.builder(
                  itemCount: viewModel.products.length,
                  itemBuilder: (context, index) {
                    final product = viewModel.products[index];
                    return GestureDetector(
                      onTap: () => viewModel.toggleExpanded(index),
                      child:
                          ProductItemView(product, viewModel.isExpanded(index)),
                    );
                  },
                ),
    );
  }

  @override
  ProductListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductListViewModel();
  @override
  void onViewModelReady(ProductListViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.fetchProducts();
  }
}
