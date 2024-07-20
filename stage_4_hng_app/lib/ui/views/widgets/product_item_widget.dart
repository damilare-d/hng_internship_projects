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
                        : Image.asset(
                            'assets/images/empty_img_placeholders.jpg'))
                    as ImageProvider,
                height: 180,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                      'assets/images/empty_img_placeholders.jpg');
                },
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.product.name,
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
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
                height: 28,
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(0, 114, 98, 0.12)),
                child: IconButton(
                  onPressed: () {
                    cartService.addToCart(widget.product);
                    cartService.showProductAddedToCartBottomSheet();
                    widget.onAddToCart!();
                  },
                  icon: const Icon(
                    Icons.shopping_basket_outlined,
                   // size: 12,
                    //color: Color(0xff0072C61F),
                  ),
                ),
              ),
            ],
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     cartService.addToCart(widget.product);
          //     cartService.showProductAddedToCartBottomSheet();
          //     widget.onAddToCart();
          //   },
          //   child: const Text('Add to Cart'),
          // ),
        ],
      ),
    );
  }
}
