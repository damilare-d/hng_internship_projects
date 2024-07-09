import 'package:stacked/stacked.dart';
import 'package:tombu_shopping_app/app/app.locator.dart';
import 'package:tombu_shopping_app/models/product_model.dart';
import 'package:tombu_shopping_app/services/api_service.dart';

class ProductListViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();

  List<Product> _products = [];
  List<Product> get products => _products;
  List<bool> _expanded = [];
  int _currentPage = 1;
  final int _itemsPerPage = 10;

  int get currentPage => _currentPage;

  List<bool> get expanded => _expanded;

  Future<void> fetchProducts({int page = 1}) async {
    setBusy(true);
    try {
      _products = await _apiService.fetchProducts(page, _itemsPerPage);
      _expanded = List<bool>.filled(_products.length, false);
      _currentPage = page;
      notifyListeners();
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

  void previousPage() {
    if (_currentPage > 1) {
      fetchProducts(page: _currentPage - 1);
    }
  }

  void nextPage() {
    fetchProducts(page: _currentPage + 1);
  }
}
