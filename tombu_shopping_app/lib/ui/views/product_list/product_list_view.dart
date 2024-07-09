import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tombu_shopping_app/ui/views/product/product_view.dart';
import '../../widgets/product_item_view.dart';
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
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : viewModel.hasError
              ? Center(child: Text('Error: ${viewModel.modelError}'))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: viewModel.products.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              viewModel.toggleExpanded(index);
                            },
                            child: ProductItemWidget(
                              product: viewModel.products[index],
                              expanded: viewModel.expanded[index],
                              onTapIcon: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        ProductView(
                                            product: viewModel.products[index]),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: viewModel.previousPage,
                        ),
                        Text('Page ${viewModel.currentPage}'),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: viewModel.nextPage,
                        ),
                      ],
                    ),
                  ],
                ),
    );
  }

  @override
  ProductListViewModel viewModelBuilder(BuildContext context) =>
      ProductListViewModel();

  @override
  void onViewModelReady(ProductListViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.fetchProducts();
  }
}
