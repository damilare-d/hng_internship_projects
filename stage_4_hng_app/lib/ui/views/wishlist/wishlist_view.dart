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
          : Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 0.8,
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
    );
  }

  @override
  WishlistViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WishlistViewModel();
}
