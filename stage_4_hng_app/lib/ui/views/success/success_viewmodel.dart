import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_4_hng_app/app/app.locator.dart';
import 'package:stage_4_hng_app/app/app.router.dart';
import 'package:stage_4_hng_app/services/app_service.dart';
import 'package:stage_4_hng_app/services/cart_service_service.dart';
import 'package:stage_4_hng_app/services/checkout_service.dart';
import 'package:stage_4_hng_app/services/order_service.dart';

class SuccessViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _cartService = locator<CartServiceService>();
  final _appService = locator<AppService>();
  final _orderService = locator<OrderService>();
  final _checkoutService = locator<CheckoutService>();

  void Function(int value) get onItemTapped => _appService.onItemTapped;

  void addItemToOrderList() {
    _orderService.addOrders(_checkoutService.checkoutItems);
  }

  void onTapOk() {
    addItemToOrderList();
    _cartService.clearItems();
    _appService.onItemTapped(0);
    _navigationService.navigateTo(Routes.dashboardView);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_appService];
}
