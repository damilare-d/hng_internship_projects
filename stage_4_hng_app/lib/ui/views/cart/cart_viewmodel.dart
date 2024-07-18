import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_4_hng_app/app/app.router.dart';

import 'package:stage_4_hng_app/services/cart_service_service.dart';

import '../../../app/app.locator.dart';

class CartViewModel extends ReactiveViewModel {
  final _cartService = locator<CartServiceService>();
  final _navigationService = locator<NavigationService>();

  get cartItems => _cartService.cartItems;
  get getTotalPrice => _cartService.getTotalPrice();

  void onTapCheckOut() {
    print("button tapped");
    _navigationService.navigateTo(Routes.checkoutView);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_cartService];
}
