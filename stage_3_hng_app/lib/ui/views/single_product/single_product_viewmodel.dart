import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_3_hng_app/app/app.locator.dart';
import 'package:stage_3_hng_app/app/app.router.dart';
import 'package:stage_3_hng_app/services/product_detail_service.dart';



class SingleProductViewModel extends BaseViewModel {
   ProductDetailService _productDetailService = locator<ProductDetailService>();

  //SingleProductViewModel(this._productDetailService);

    List<String> imageUrls = [];

  final NavigationService _navigationService = locator<NavigationService>();


  String get selectedColor => _productDetailService.selectedColor;
  int get quantity => _productDetailService.quantity;
  String get description => _productDetailService.description;
  String get productTitle => _productDetailService.productTitle;
  String get price => _productDetailService.price;

  void setSelectedColor(String color) {
    _productDetailService.setSelectedColor(color);
    notifyListeners();
  }

  void setQuantity(int qty) {
    _productDetailService.setQuantity(qty);
    notifyListeners();
  }

  void setDescription(String desc) {
    _productDetailService.setDescription(desc);
    notifyListeners();
  }

  void setProductTitle(String title) {
    _productDetailService.setProductTitle(title);
    notifyListeners();
  }

  void setPrice(String price) {
    _productDetailService.setPrice(price);
    notifyListeners();
  }

   void navigateToSingleProductView() {
     _navigationService.navigateTo(Routes.singleProductView);
   }
}
