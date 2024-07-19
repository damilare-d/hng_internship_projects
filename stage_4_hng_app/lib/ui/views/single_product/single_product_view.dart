import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_4_hng_app/ui/views/widgets/product_item_widget.dart';

import 'single_product_viewmodel.dart';

class SingleProductView extends StatelessWidget {
  const SingleProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SingleProductViewModel>.reactive(
      viewModelBuilder: () => SingleProductViewModel(),
      builder: (context, viewModel, child) {
        if (viewModel.product == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Product Details'),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(viewModel.productTitle),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSlider(viewModel),
                const SizedBox(height: 16.0),
                const Text(
                  'Brand Title',
                  style: TextStyle(
                    fontFamily: 'Roboto Flex',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
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
                    fontWeight: FontWeight.w500,
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

  Widget _buildSlider(SingleProductViewModel viewModel) {
    List<String> imageUrls = viewModel.product!.photos
        .map((photo) => 'https://api.timbu.cloud/images/${photo.url}')
        .toList();

    if (imageUrls.isEmpty) {
      imageUrls = ['assets/images/empty_img_placeholders.jpg'];
    }

    return _buildCarouselSlider(imageUrls);
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
        const Text('Size',
            style: TextStyle(
                fontFamily: 'Roboto Flex',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                height: 17.58 / 15)),
        Wrap(
          spacing: 8.0,
          children: viewModel.sizes.map((size) {
            return ChoiceChip(
              label: Text(size),
              selected: viewModel.selectedSize == size,
              onSelected: (bool selected) {
                viewModel.setSelectedSize(size);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildColorSelector(SingleProductViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color',
            style: TextStyle(
                fontFamily: 'Roboto Flex',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                height: 17.58 / 15)),
        Wrap(
          spacing: 8.0,
          children: viewModel.colors.map((color) {
            return GestureDetector(
              onTap: () {
                viewModel.setSelectedColor(color);
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: viewModel.getColorFromString(color),
                  border: Border.all(
                    color: viewModel.selectedColor == color
                        ? Colors.black
                        : Colors.transparent,
                  ),
                ),
                child: viewModel.selectedColor == color
                    ? const Icon(Icons.check, color: Colors.white)
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector(SingleProductViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quantity",
          style: TextStyle(
              fontFamily: 'Roboto Flex',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 17.58 / 15),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                viewModel.setQuantity(
                    viewModel.quantity > 1 ? viewModel.quantity - 1 : 1);
              },
            ),
            Text(viewModel.quantity.toString(),
                style: const TextStyle(
                    fontFamily: 'Roboto Flex',
                    fontSize: 15,
                    fontWeight: FontWeight.w400)),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                viewModel.setQuantity(viewModel.quantity + 1);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMoreFromEgo(SingleProductViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('More from Ego',
            style: TextStyle(
                fontFamily: 'Roboto Flex',
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 28.13 / 24)),
        SizedBox(
          height: 350,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.5,
            ),
            itemCount: viewModel.products.length,
            itemBuilder: (context, index) {
              final product = viewModel.products[index];
              return ProductItem(
                product: product,
                onTap: () => viewModel.navigateToSingleProductView(),
                onAddToCart: () {},
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
        Text(viewModel.price,
            style: const TextStyle(
                fontFamily: 'Roboto Flex',
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 28.13 / 24)),
        ElevatedButton(
          onPressed: () {
            viewModel.navigateToCartView();
          },
          child: const Text('Add to Cart'),
        ),
      ],
    );
  }
}
