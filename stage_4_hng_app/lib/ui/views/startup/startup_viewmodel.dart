import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:stage_4_hng_app/app/app.locator.dart';
import 'package:stage_4_hng_app/app/app.router.dart';
import 'package:stage_4_hng_app/models/product_model.dart';
import 'package:stage_4_hng_app/services/product_detail_service.dart';

import '../../../services/api_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();
  final _productDetailService = locator<ProductDetailService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    await fetchProducts();

    _navigationService.replaceWithDashboardView();
  }

  Future<void> fetchProducts() async {
    setBusy(true);
    try {
      List<Product> products = await _apiService.fetchProducts();
      _productDetailService
          .setProducts(products); // Store products in the service
      clearErrors();
    } catch (e) {
      setError(e.toString());
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }
}
