import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_4_hng_app/app/app.locator.dart';
import 'package:stage_4_hng_app/models/product_model.dart';
import 'package:stage_4_hng_app/services/cart_service_service.dart';
import 'package:stage_4_hng_app/services/wishlist_service.dart';

import '../../../app/app.bottomsheets.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final String? imageUrl;
  final String? price;
  final String? name;
  final VoidCallback? onAddToCart;
  final VoidCallback onTap;

  ProductItem({
    Key? key,
    this.imageUrl,
    this.price,
    this.name,
    this.onAddToCart,
    required this.onTap,
    required this.product,
  }) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  final cartService = locator<CartServiceService>();
  final wishlistService = locator<WishlistService>();
  final bottomSheetService = locator<BottomSheetService>();

  bool isWishlisted = false;

  @override
  void initState() {
    super.initState();
    isWishlisted = wishlistService.isWishlisted(widget.product);
  }

  void toggleWishlist() {
    setState(() {
      isWishlisted = !isWishlisted;
      if (isWishlisted) {
        wishlistService.addToWishlist(widget.product);
        bottomSheetService.showCustomSheet(
          variant: BottomSheetType.notice,
          title: 'Added to Wishlist',
          description:
          '${widget.product.name} has been added to your wishlist.',
        );
      } else {
        wishlistService.removeFromWishlist(widget.product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String brandName = widget.product.categories.isNotEmpty
        ? widget.product.categories.first.name
        : 'Unknown Brand';

    return Container(
      height: 500,
      width: 168,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            GestureDetector(
              onTap: widget.onTap,
              child: Image(
                image: (widget.product.photos.isNotEmpty
                    ? NetworkImage(
                    "https://api.timbu.cloud/images/${widget.product.photos[0].url}")
                    : const AssetImage(
                    'assets/images/empty_img_placeholders.jpg'))
                as ImageProvider,
                height: 180,
                // errorBuilder: (context, error, stackTrace) {
                //   return const AssetImage(
                //       'assets/images/empty_img_placeholders.jpg');
                // },
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: toggleWishlist,
                child: SizedBox(
                    height: 32,
                    child: isWishlisted
                        ? const Image(
                      image: AssetImage(
                          "assets/images/Like_interaction_2.png"),
                    )
                        : const Image(
                      image:
                      AssetImage("assets/images/Like_interaction.png"),
                    )),
              ),
            )
          ]),
          const SizedBox(height: 8),
          Text(
            brandName,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 8),
          Text(
            widget.product.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              height: 14.06 / 12,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.product.currentPrice.toString(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: const Color(0xFF0072C6),
                ),
              ),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(0, 114, 198, 0.12)),
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    cartService.addToCart(widget.product);
                    cartService.showProductAddedToCartBottomSheet();
                    widget.onAddToCart!();
                  },
                  icon: const Icon(
                    Icons.shopping_basket_outlined,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
