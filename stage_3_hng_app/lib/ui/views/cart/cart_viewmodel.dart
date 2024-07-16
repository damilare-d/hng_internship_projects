import 'package:stacked/stacked.dart';
import 'package:stage_3_hng_app/models/product_model.dart';
import 'package:stage_3_hng_app/services/cart_service_service.dart';

import '../../../app/app.locator.dart';

class CartViewModel extends ReactiveViewModel {
  final _cartService = locator<CartServiceService>();

  get cartItems => _cartService.cartItems;
  get getTotalPrice => _cartService.getTotalPrice();

  @override
  List<ListenableServiceMixin> get listenableServices => [_cartService];
}
