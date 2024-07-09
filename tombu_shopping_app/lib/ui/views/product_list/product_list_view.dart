import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tombu_shopping_app/ui/views/product/product_view.dart';
import '../../widgets/product_item_view.dart';
import 'product_list_viewmodel.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductListViewModel>.reactive(
      viewModelBuilder: () => ProductListViewModel(),
      onViewModelReady: (viewModel) => viewModel.fetchProducts(),
      builder: (context, viewModel, child) {
        if (viewModel.hasError) {
          _showErrorDialog(context, viewModel);
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Products'),
          ),
          body: viewModel.isBusy
              ? const Center(child: CircularProgressIndicator())
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
      },
    );
  }

  void _showErrorDialog(BuildContext context, ProductListViewModel viewModel) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text('Error: ${viewModel.modelError}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                viewModel.retryFetchProducts();
              },
              child: const Text('Retry'),
            ),
          ],
        );
      },
    );
  }
}
