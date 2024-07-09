import 'package:stacked/stacked.dart';
import 'package:tombu_shopping_app/app/app.locator.dart';
import 'package:tombu_shopping_app/app/app.router.dart';
import 'package:tombu_shopping_app/models/product_model.dart';
import 'package:tombu_shopping_app/services/api_service.dart';
import 'package:flutter/material.dart';

class ProductListViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();

  List<Product> _products = [];
  List<Product> get products => _products;
  List<bool> _expanded = [];
  int _currentPage = 1;

  int get currentPage => _currentPage;

  get expanded => _expanded;

  Future<void> fetchProducts() async {
    setBusy(true);
    try {
      _products = await _apiService.fetchProducts();
      _expanded = List<bool>.filled(_products.length, false);
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
      _currentPage--;
      fetchProducts();
    }
  }

  void nextPage() {
    _currentPage++;
    fetchProducts();
  }

}
