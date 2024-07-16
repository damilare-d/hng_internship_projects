import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_3_hng_app/app/app.locator.dart';
import 'package:stage_3_hng_app/app/app.router.dart';

class SuccessViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

 void onTapOk() {
   _navigationService.navigateTo(Routes.dashboardView);
 }
}
