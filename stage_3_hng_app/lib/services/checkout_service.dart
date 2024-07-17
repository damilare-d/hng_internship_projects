import 'package:stacked/stacked.dart';
import 'package:stage_3_hng_app/app/app.locator.dart';
import 'package:stage_3_hng_app/services/cart_service_service.dart';

class CheckoutService with ListenableServiceMixin {
  final _cartService = locator<CartServiceService>();

  List<Map<String, dynamic>> get checkoutItems => _cartService.cartItems;
  int get getTotalItems => _cartService.getTotalItems();
  double get getTotalPrice => _cartService.getTotalPrice();
}
