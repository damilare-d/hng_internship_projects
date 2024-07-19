import 'package:stacked/stacked.dart';
import 'package:stage_4_hng_app/app/app.locator.dart';
import 'package:stage_4_hng_app/services/product_detail_service.dart';
import 'package:stage_4_hng_app/models/product_model.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_4_hng_app/app/app.router.dart';

class AllProductsViewModel extends BaseViewModel {
  final ProductDetailService _productDetailService = locator<ProductDetailService>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<Product> get products => _productDetailService.products;

  void navigateToProductDetails(Product product) {
    _productDetailService.setCurrentProduct(product);
    _navigationService.navigateTo(Routes.singleProductView);
  }
}
