
import 'package:stacked/stacked.dart';
import '../../../models/product_model.dart';
import '../../../services/api_service.dart';
import '../../../app/app.locator.dart';

class ProductListViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();

  List<Product> _products = [];
  List<Product> get products => _products;
  List<bool> _expanded = [];

  Future<void> fetchProducts() async {
    setBusy(true);

    try {
      _products = await _apiService.fetchProducts();
      _expanded = List<bool>.filled(_products.length, false);
      setError(null);
    } catch (e) {
      setError(e.toString());
    } finally {
      setBusy(false);
    }
  }

  void toggleExpanded(int index) {
    _expanded[index] = !_expanded[index];
    notifyListeners();
  }

  bool isExpanded(int index) => _expanded[index];
}
