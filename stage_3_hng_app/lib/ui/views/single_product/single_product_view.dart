import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_3_hng_app/ui/views/single_product/single_product_viewmodel.dart';
import 'package:stage_3_hng_app/ui/views/widgets/product_item_widget.dart';

class SingleProductView extends StatelessWidget {

  const SingleProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SingleProductViewModel>.reactive(
      viewModelBuilder: () => SingleProductViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(''),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCarouselSlider(viewModel.imageUrls),
                const SizedBox(height: 16.0),
                const Text(
                  'Brand Title',
                  style: TextStyle(
                    fontFamily: 'Roboto Flex',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 14.06 / 12,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  viewModel.productTitle,
                  style: const TextStyle(
                    fontFamily: 'Roboto Flex',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 28.13 / 24,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  viewModel.price,
                  style: const TextStyle(
                    fontFamily: 'Roboto Flex',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 17.58 / 15,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontFamily: 'Roboto Flex',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 17.58 / 15,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  viewModel.description,
                  style: const TextStyle(
                    fontFamily: 'Roboto Flex',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 17.58 / 15,
                  ),
                ),
                const SizedBox(height: 16.0),
                _buildSizeSelector(viewModel),
                const SizedBox(height: 16.0),
                _buildColorSelector(viewModel),
                const SizedBox(height: 16.0),
                _buildQuantitySelector(viewModel),
                const SizedBox(height: 16.0),
                _buildMoreFromEgo(viewModel),
                const SizedBox(height: 16.0),
                _buildTotalPriceAndAddToCartButton(viewModel),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCarouselSlider(List<String> imageUrls) {
    return CarouselSlider(
      options: CarouselOptions(height: 200.0, autoPlay: true),
      items: imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(url, fit: BoxFit.cover);
          },
        );
      }).toList(),
    );
  }

  Widget _buildSizeSelector(SingleProductViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Size', style: TextStyle(fontFamily: 'Roboto Flex', fontSize: 15, fontWeight: FontWeight.w400)),
        Wrap(
          spacing: 8.0,
          children: List.generate(6, (index) {
            return ChoiceChip(
              label: Text('${32 + index * 3}'),
              selected: false, // Logic to handle selection
              onSelected: (bool selected) {
                // Handle size selection
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildColorSelector(SingleProductViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color', style: TextStyle(fontFamily: 'Roboto Flex', fontSize: 15, fontWeight: FontWeight.w400)),
        Wrap(
          spacing: 8.0,
          children: List.generate(6, (index) {
            return GestureDetector(
              onTap: () {
                viewModel.setSelectedColor('Color $index');
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.primaries[index],
                  border: Border.all(
                    color: viewModel.selectedColor == 'Color $index' ? Colors.black : Colors.transparent,
                  ),
                ),
                child: viewModel.selectedColor == 'Color $index' ? const Icon(Icons.check, color: Colors.white) : null,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector(SingleProductViewModel viewModel) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            viewModel.setQuantity(viewModel.quantity > 1 ? viewModel.quantity - 1 : 1);
          },
        ),
        Text(viewModel.quantity.toString(), style: const TextStyle(fontFamily: 'Roboto Flex', fontSize: 15, fontWeight: FontWeight.w400)),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            viewModel.setQuantity(viewModel.quantity + 1);
          },
        ),
      ],
    );
  }

  Widget _buildMoreFromEgo(SingleProductViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('More from Ego', style: TextStyle(fontFamily: 'Roboto Flex', fontSize: 15, fontWeight: FontWeight.w400)),
        SizedBox(
          height: 200,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return ProductItem(
                imageUrl: 'assets/images/empty_img_placeholders.jpg',
                price: '\$50',
                name: 'Product $index',
                onAddToCart: () {
                  // Add to cart action
                },
                onTap: viewModel.navigateToSingleProductView,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTotalPriceAndAddToCartButton(SingleProductViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total Price', style: TextStyle(fontFamily: 'Roboto Flex', fontSize: 19, fontWeight: FontWeight.w500)),
            Text(viewModel.price, style: const TextStyle(fontFamily: 'Roboto Flex', fontSize: 12, fontWeight: FontWeight.w400)),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Add to cart action
          },
          icon: const Icon(Icons.shopping_cart),
          label: const Text('Add to Cart'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: const Color(0xFF0072C6), // White text color
          ),
        ),
      ],
    );
  }
}
