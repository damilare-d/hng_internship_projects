import 'package:stage_3_hng_app/app/app.bottomsheets.dart';
import 'package:stage_3_hng_app/app/app.dialogs.dart';
import 'package:stage_3_hng_app/app/app.locator.dart';
import 'package:stage_3_hng_app/models/product_model.dart';
import 'package:stage_3_hng_app/services/api_service.dart';
import 'package:stage_3_hng_app/services/product_detail_service.dart';
import 'package:stage_3_hng_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _productDetailService = locator<ProductDetailService>();
  final _apiService = locator<ApiService>();

  List<Product> get products => _productDetailService.products;

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;
  // final List<Product> _products = locator<ProductDetailService>().products;
  // List<Product> get products => _products;

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

  void navigateToSingleProductView() {
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
}
