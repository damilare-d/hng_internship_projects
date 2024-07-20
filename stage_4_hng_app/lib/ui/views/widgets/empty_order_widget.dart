import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_4_hng_app/app/app.locator.dart';
import 'package:stage_4_hng_app/app/app.router.dart';
import 'package:stage_4_hng_app/services/app_service.dart';
import 'package:stage_4_hng_app/ui/views/widgets/button_widget.dart';

class EmptyOrderWidget extends StatelessWidget {
  const EmptyOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationService = locator<NavigationService>();
    final appService = locator<AppService>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 16,
        ),
        const Image(
          image: AssetImage("assets/images/empty_order_image.png"),
        ),
        const SizedBox(
          height: 8,
        ),
        ButtonWidget(
          buttonText: "Discover products",
          onTap: () {
            appService.onItemTapped(1);
           // navigationService.navigateTo(Routes.allProductsView);
          },
        ),
      ],
    );
  }
}
