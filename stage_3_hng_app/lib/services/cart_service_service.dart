import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_3_hng_app/app/app.bottomsheets.dart';
import 'package:stage_3_hng_app/app/app.locator.dart';
import 'package:stage_3_hng_app/models/product_model.dart';
import 'package:stage_3_hng_app/services/product_detail_service.dart';

class CartServiceService with ListenableServiceMixin {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  Future<void> showProductAddedToCartBottomSheet() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.productAddToCart,
      title: 'Product Added',
      description: 'The product has been added to your cart.',
    );

    // Wait for 5 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Close the bottom sheet
    _bottomSheetService.completeSheet(SheetResponse());
  }

  void addToCart(Product product) {
    _cartItems.add({
      'product': product,
      'quantity': 1,
      'selectedColor': locator<ProductDetailService>().selectedColor,
      'selectedSize': locator<ProductDetailService>().selectedSize,
    });
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item['product'] == product);
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    int index = _cartItems.indexWhere((item) => item['product'] == product);
    if (index != -1) {
      _cartItems[index]['quantity']++;
      notifyListeners();
    }
  }

  void decreaseQuantity(Product product) {
    int index = _cartItems.indexWhere((item) => item['product'] == product);
    if (index != -1) {
      if (_cartItems[index]['quantity'] > 1) {
        _cartItems[index]['quantity']--;
        notifyListeners();
      }
    }
  }

  clearItems() {
    _cartItems.clear();
  }

  int getTotalItems() {
    return _cartItems.fold<int>(
        0, (total, item) => total + item['quantity'] as int);
  }

  double getTotalPrice() {
    return _cartItems.fold(
        0.0,
        (total, item) =>
            total + item['product'].currentPrice * item['quantity']);
  }
}
