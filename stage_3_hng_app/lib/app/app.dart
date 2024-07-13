import 'package:stage_3_hng_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stage_3_hng_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stage_3_hng_app/ui/views/home/home_view.dart';
import 'package:stage_3_hng_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_3_hng_app/ui/views/dashboard/dashboard_view.dart';
import 'package:stage_3_hng_app/ui/views/single_product/single_product_view.dart';
import 'package:stage_3_hng_app/ui/views/cart/cart_view.dart';
import 'package:stage_3_hng_app/services/product_detail_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: SingleProductView),
    MaterialRoute(page: CartView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ProductDetailService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
