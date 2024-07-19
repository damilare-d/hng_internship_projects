import 'package:stacked/stacked.dart';
import 'package:stage_4_hng_app/app/app.locator.dart';
import 'package:stage_4_hng_app/models/product_model.dart';
import 'package:stage_4_hng_app/services/order_service.dart';

class SingleOrderViewModel extends BaseViewModel {
  final OrderService _orderService = locator<OrderService>();
  late Map<String, dynamic> _order;

  SingleOrderViewModel(int orderIndex) {
    _order = _orderService.orders[orderIndex];
  }

  Product get product => _order['product'];
  int get quantity => _order['quantity'];
  String get selectedColor => _order['selectedColor'];
  String get selectedSize => _order['selectedSize'];
}
