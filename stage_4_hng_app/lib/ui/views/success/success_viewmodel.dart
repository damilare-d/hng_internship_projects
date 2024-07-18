import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_4_hng_app/app/app.locator.dart';
import 'package:stage_4_hng_app/app/app.router.dart';
import 'package:stage_4_hng_app/services/app_service.dart';
import 'package:stage_4_hng_app/services/cart_service_service.dart';


class SuccessViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _cartService = locator<CartServiceService>();
  final _appService = locator<AppService>();

  void Function(int value) get onItemTapped => _appService.onItemTapped;

  void onTapOk() {
    _cartService.clearItems();
    _appService.onItemTapped(0);
    _navigationService.navigateTo(Routes.dashboardView);
  }

  @override
  // TODO: implement listenableServices
  List<ListenableServiceMixin> get listenableServices => [_appService];
}
