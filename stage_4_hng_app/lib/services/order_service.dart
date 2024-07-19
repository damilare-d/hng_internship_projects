import 'package:stacked/stacked.dart';
import 'package:stage_4_hng_app/models/product_model.dart';

class OrderService with ListenableServiceMixin {
  final List<Map<String, dynamic>> _orders = [];

  List<Map<String, dynamic>> get orders => _orders;

  void addOrder(Product product, int quantity, String color, String size) {
    _orders.add({
      'product': product,
      'quantity': quantity,
      'selectedColor': color,
      'selectedSize': size,
    });
    notifyListeners();
  }

  void addOrders(List<Map<String, dynamic>> newOrders) {
    _orders.addAll(newOrders);
    notifyListeners();
  }

  void clearOrders() {
    _orders.clear();
    notifyListeners();
  }
}
