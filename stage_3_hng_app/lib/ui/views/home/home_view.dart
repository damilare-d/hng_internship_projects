import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_3_hng_app/app/app.router.dart';
import 'package:stage_3_hng_app/ui/views/widgets/brand_widget.dart';
import 'package:stage_3_hng_app/ui/views/widgets/product_item_widget.dart';
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
            _buildSlider(),
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
    )));
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

Widget _buildSlider() {
  // Replace with your slider implementation
  return Container(
    height: 200,
    color: Colors.grey[300],
    child: const Center(child: Text('Slider Placeholder')),
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

Widget _buildFeaturedSneakersSection(HomeViewModel viewModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      const Text(
        'Featured Sneakers',
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
