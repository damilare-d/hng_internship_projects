import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_4_hng_app/ui/views/widgets/wishlist_empty_widget.dart';
import 'package:stage_4_hng_app/ui/views/widgets/wishlist_item_widget.dart';
import 'wishlist_viewmodel.dart';

class WishlistView extends StackedView<WishlistViewModel> {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WishlistViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wishlist"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: viewModel.wishList.isEmpty
          ? const EmptyWishlist()
          : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 0.6,
                    ),
                    itemCount: viewModel.wishList.length,
                    itemBuilder: (context, index) {
                      return WishListItem(
                        onAddToCart: () {},
                        onTap: ()=> viewModel
                            .navigateToSingleProductView(viewModel.wishList[index]),
                        product: viewModel.wishList[index],
                      );
                    },
                  ),
                ],
              ),
          ),
    );
  }

  @override
  WishlistViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WishlistViewModel();
}
