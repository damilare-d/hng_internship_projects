import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_4_hng_app/app/app.locator.dart';
import 'package:stage_4_hng_app/app/app.router.dart';
import 'package:stage_4_hng_app/services/order_service.dart';

class OrdersViewModel extends BaseViewModel {
  final OrderService _orderService = locator<OrderService>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<Map<String, dynamic>> get orders => _orderService.orders;

  void navigateToOrderDetails(int index) {
    _navigationService.navigateTo(
      Routes.singleOrderView,
      arguments: SingleOrderViewArguments(orderIndex: index),
    );
  }
}
