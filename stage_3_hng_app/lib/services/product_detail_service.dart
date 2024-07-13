import 'package:flutter/material.dart';

class ProductDetailService with ChangeNotifier {
  String _selectedColor = '';
  int _quantity = 1;
  String _description = '';
  String _productTitle = '';
  String _price = '';

  String get selectedColor => _selectedColor;
  int get quantity => _quantity;
  String get description => _description;
  String get productTitle => _productTitle;
  String get price => _price;

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
}
