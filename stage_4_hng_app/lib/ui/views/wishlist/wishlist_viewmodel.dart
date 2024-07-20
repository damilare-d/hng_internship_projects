import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_4_hng_app/app/app.locator.dart';
import 'package:stage_4_hng_app/app/app.router.dart';
import 'package:stage_4_hng_app/models/product_model.dart';
import 'package:stage_4_hng_app/services/product_detail_service.dart';
import 'package:stage_4_hng_app/services/wishlist_service.dart';

class WishlistViewModel extends ReactiveViewModel {
  final _wishlistService = locator<WishlistService>();
  final _productDetailService = locator<ProductDetailService>();
  final _navigationService = locator<NavigationService>();

  List<Product> get wishList => _wishlistService.wishlist ;

  void navigateToSingleProductView(Product product) {
    _productDetailService.setCurrentProduct(product);
    _navigationService.navigateTo(Routes.singleProductView);
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_wishlistService];
}
