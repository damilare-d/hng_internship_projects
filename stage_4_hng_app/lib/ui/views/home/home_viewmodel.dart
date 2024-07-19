import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_4_hng_app/services/app_service.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../models/product_model.dart';
import '../../../services/api_service.dart';
import '../../../services/product_detail_service.dart';
import '../../common/app_strings.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _productDetailService = locator<ProductDetailService>();
  final _apiService = locator<ApiService>();
  final _appService = locator<AppService>();

  List<Product> get products => _productDetailService.products;

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  void iconSearch() {}

  void navigateToSingleProductView(Product product) {
    _productDetailService.setCurrentProduct(product);
    _navigationService.navigateTo(Routes.singleProductView);
  }

  Future<void> fetchProducts() async {
    setBusy(true);
    try {
      List<Product> products = await _apiService.fetchProducts();
      _productDetailService.setProducts(products);
      clearErrors();
    } catch (e) {
      setError(e.toString());
    } finally {
      setBusy(false);
    }
  }

  void viewMore() {
    _appService.onItemTapped(1);
  }
}
