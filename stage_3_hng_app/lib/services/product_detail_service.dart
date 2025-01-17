import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stage_3_hng_app/models/product_model.dart';

class ProductDetailService with ListenableServiceMixin {
  String _selectedColor = '';
  int _quantity = 1;
  String _description = '';
  String _productTitle = '';
  String _price = '';
  String _selectedSize = '';
  List<Product> _products = [];
  Product? _currentProduct;

  String get selectedColor => _selectedColor;
  int get quantity => _quantity;
  String get description => _description;
  String get productTitle => _productTitle;
  String get price => _price;
  String get selectedSize => _selectedSize;
  List<Product> get products => _products;
  Product? get currentProduct => _currentProduct;

  void setCurrentProduct(Product product) {
    _currentProduct = product;
    _description = product.description ?? '';
    _productTitle = product.name ?? '';
    _price = product.currentPrice != null ? '\$${product.currentPrice}' : '';
    notifyListeners();
  }

  void setSelectedColor(String color) {
    _selectedColor = color;
    notifyListeners();
  }

  void setQuantity(int qty) {
    _quantity = qty;
    notifyListeners();
  }

  void setDescription(String desc) {
    _description = desc;
    notifyListeners();
  }

  void setProductTitle(String title) {
    _productTitle = title;
    notifyListeners();
  }

  void setPrice(String price) {
    _price = price;
    notifyListeners();
  }

  void setSelectedSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }

  void setProducts(List<Product> products) {
    _products = products;
    notifyListeners();
  }
}
