import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stage_4_hng_app/models/product_model.dart';
import 'package:stage_4_hng_app/ui/views/home/home_viewmodel.dart';

class ProductCarouselSlider extends StatelessWidget {
  final HomeViewModel viewModel;

  const ProductCarouselSlider({required this.viewModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSlider(viewModel, context);
  }

  Widget _buildSlider(HomeViewModel viewModel, BuildContext context) {
    if (viewModel.products.isEmpty) {
      return Image.asset('assets/images/empty_img_placeholders.jpg');
    }

    return CarouselSlider(
      options:
          CarouselOptions(height: 200.0, viewportFraction: 0.9, autoPlay: true),
      items: viewModel.products.map((product) {
        String imageUrl =
            'https://api.timbu.cloud/images/${product.photos.first.url}';
        return _buildCarouselItem(context, imageUrl, product);
      }).toList(),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, String imageUrl, Product product) {
    return Container(
      //padding: const EdgeInsets.all(16),
      height: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            width: 156,
            height: 156,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Brand name", // Assuming you have a brand name
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              Text(
                product.name,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              Text(
                '\$${product.currentPrice}',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: const Color(0xFF0072C6),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
