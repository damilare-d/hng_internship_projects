import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:stage_4_hng_app/app/app.locator.dart';
import 'package:stage_4_hng_app/app/app.router.dart';
import 'package:stage_4_hng_app/services/product_detail_service.dart';
import '../../../models/product_model.dart';
import 'package:flutter/material.dart';

class SingleProductViewModel extends ReactiveViewModel {
  final ProductDetailService _productDetailService =
      locator<ProductDetailService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Product? _product;
  Product? get product => _product;
  List<Product> get products => _productDetailService.products;

  String get selectedColor => _productDetailService.selectedColor;
  String? selectedSize;

  List<String> get sizes => ['S', 'M', 'L', 'XL', 'XXL']; // Example sizes
  List<String> get colors =>
      ['Red', 'Blue', 'Green', 'Yellow', 'Black', 'White']; // Example colors

  int get quantity => _productDetailService.quantity;
  String get description => _product?.description ?? "";
  String get productTitle => _product?.name ?? "";
  String get price =>
      _product != null ? '\$${_product!.currentPrice.toString()}' : "";

  SingleProductViewModel() {
    _product = _productDetailService.currentProduct;
  }

  void initialize(Product product) {
    _product = _productDetailService.currentProduct ?? product;
    notifyListeners();
  }

  void setSelectedColor(String color) {
    _productDetailService.setSelectedColor(color);
    notifyListeners();
  }

  void setSelectedSize(String size) {
    selectedSize = size;
    _productDetailService.setSelectedSize(size);
    notifyListeners();
  }

  void setQuantity(int qty) {
    _productDetailService.setQuantity(qty);
    notifyListeners();
  }

  void navigateToSingleProductView() {
    _navigationService.navigateTo(Routes.singleProductView);
  }

  void navigateToCartView() {
    _navigationService.navigateTo(Routes.cartView);
  }

  Color getColorFromString(String color) {
    switch (color) {
      case 'Red':
        return Colors.red;
      case 'Blue':
        return Colors.blue;
      case 'Green':
        return Colors.green;
      case 'Yellow':
        return Colors.yellow;
      case 'Black':
        return Colors.black;
      case 'White':
        return Colors.white;
      default:
        return Colors.grey;
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_productDetailService];
}
