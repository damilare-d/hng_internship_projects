import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_4_hng_app/ui/views/widgets/empty_state_widget.dart';
import 'package:stage_4_hng_app/ui/views/widgets/error_state_widget.dart';
import 'package:stage_4_hng_app/ui/views/widgets/product_item_widget.dart';
import '../widgets/brand_widget.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('AG ZENARD'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserGreeting(context),
                const SizedBox(height: 16.0),
                _buildSlider(viewModel),
                const SizedBox(height: 16.0),
                _buildBrandsSection(),
                const SizedBox(height: 16.0),
                _buildSpecialOffersSection(viewModel),
                const SizedBox(height: 16.0),
                _buildFeaturedSneakersSection(viewModel),
                const SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0072C6),
                    ),
                    child: const Text('View More'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

Widget _buildUserGreeting(BuildContext context) {
  return Row(
    children: [
      const CircleAvatar(
        radius: 20,
        child: Text('AD'),
      ),
      const SizedBox(width: 8.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good afternoon 👋🏽',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  height: 1.17,
                ),
          ),
          Text(
            'User Name',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  height: 1.17,
                ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildSlider(HomeViewModel viewModel) {
  // Extract image URLs from products
  List<String> imageUrls = viewModel.products
      .expand((product) => product.photos
          .map((photo) => 'https://api.timbu.cloud/images/${photo.url}'))
      .toList();

  // Use placeholder image if no images are available
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

Widget _buildBrandsSection() {
  final Map<String, String> brands = {
    "Adidas": "assets/svgs/adidas.svg",
    "Balenciaga": "assets/svgs/balenciaga.svg",
    "Gucci": "assets/svgs/gucci.svg",
    "Jordan": "assets/svgs/jordan.svg",
    "New Balance": "assets/svgs/new.svg",
    "Reebok": "assets/svgs/reebok.svg",
    // Add more brands as needed
  };
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      const Text(
        'Brands',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 16),
      Flexible(
        fit: FlexFit.loose,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: brands.length,
          itemBuilder: (context, index) {
            String brandName = brands.keys.elementAt(index);
            String logoPath = brands.values.elementAt(index);
            return BrandWidget(
              brandName: brandName,
              logoPath: logoPath,
            );
          },
        ),
      ),
    ],
  );
}

Widget _buildSpecialOffersSection(HomeViewModel viewModel) {
  if (viewModel.isBusy) {
    return const Center(child: CircularProgressIndicator());
  } else if (viewModel.hasError) {
    return ErrorDisplayWidget(
      message: viewModel.error.toString(),
      onRetry: viewModel.fetchProducts,
    );
  } else if (viewModel.products.isEmpty) {
    return const EmptyStateWidget(message: 'No products available');
  } else {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Our Special Offers',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Flexible(
          fit: FlexFit.loose,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.5,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return ProductItem(
                imageUrl: 'assets/images/empty_img_placeholders.jpg',
                price: '\$50',
                name: 'Product $index',
                product: viewModel.products[index],
                onAddToCart: () {
                  // Add to cart action
                },
                onTap: () => viewModel
                    .navigateToSingleProductView(viewModel.products[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget _buildFeaturedSneakersSection(HomeViewModel viewModel) {
  if (viewModel.isBusy) {
    return const Center(child: CircularProgressIndicator());
  } else if (viewModel.hasError) {
    return ErrorDisplayWidget(
      message: viewModel.error.toString(),
      onRetry: viewModel.fetchProducts,
    );
  } else if (viewModel.products.isEmpty) {
    return const EmptyStateWidget(message: 'No products available');
  } else {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Our Special Offers',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Flexible(
          fit: FlexFit.loose,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.5,
            ),
            itemCount: viewModel.products.length,
            itemBuilder: (context, index) {
              final product = viewModel.products[index];
              return ProductItem(
                imageUrl: product.photos.isNotEmpty
                    ? "https://api.timbu.cloud/images/${product.photos[0].url}"
                    : 'assets/images/empty_img_placeholders.jpg',
                price: '\$${product.currentPrice}',
                name: product.name,
                product: product,
                onAddToCart: () {
                  // Add to cart action
                },
                onTap: () => viewModel
                    .navigateToSingleProductView(viewModel.products[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
