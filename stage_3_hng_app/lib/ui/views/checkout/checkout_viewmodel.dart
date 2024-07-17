import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_3_hng_app/app/app.bottomsheets.dart';
import 'package:stage_3_hng_app/app/app.locator.dart';
import 'package:stage_3_hng_app/app/app.router.dart';
import 'package:stage_3_hng_app/services/cart_service_service.dart';
import 'package:stage_3_hng_app/services/checkout_service.dart';

class CheckoutViewModel extends BaseViewModel {
  final _checkOutService = locator<CheckoutService>();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  List<Map<String, dynamic>> get checkoutItems =>
      _checkOutService.checkoutItems;
  int get getTotalItems => _checkOutService.getTotalItems;
  double get getTotalPrice => _checkOutService.getTotalPrice;

  void onTapProceed() {
    _navigationService.clearStackAndShow(Routes.successView);
  }

  void showPaymentSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.payment,
    );
  }

  void cancel() {
    _navigationService.previousRoute;
  }
}
