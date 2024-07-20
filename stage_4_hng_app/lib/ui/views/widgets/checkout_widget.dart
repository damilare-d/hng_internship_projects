import 'package:flutter/material.dart';
import 'package:stage_4_hng_app/models/product_model.dart';

class CheckoutWidget extends StatelessWidget {
  final Product product;
  final int quantity;
  final String selectedColor;
  final String selectedSize;

  const CheckoutWidget({
    Key? key,
    required this.product,
    required this.quantity,
    required this.selectedColor,
    required this.selectedSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffF9F9F9), width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: (product.photos.isNotEmpty
                    ? NetworkImage(
                        "https://api.timbu.cloud/images/${product.photos[0].url}")
                    : Image.asset('assets/images/empty_img_placeholders.jpg'))
                as ImageProvider,
            height: 100,
            width: 100,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/empty_img_placeholders.jpg');
            },
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(product.name,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, )),
                  const SizedBox(height: 8.0),
                  Text(
                    'Color: $selectedColor, Size: $selectedSize',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        '$quantity',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                     SizedBox(width: 8,),
                      Text(
                        '\$${(product.currentPrice ?? 0 * quantity).toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
