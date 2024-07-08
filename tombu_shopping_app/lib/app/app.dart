import 'package:tombu_shopping_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:tombu_shopping_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tombu_shopping_app/ui/views/home/home_view.dart';
import 'package:tombu_shopping_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tombu_shopping_app/services/api_service_service.dart';
import 'package:tombu_shopping_app/services/api_service.dart';
import 'package:tombu_shopping_app/ui/views/product_list/product_list_view.dart';
import 'package:tombu_shopping_app/ui/views/product_item/product_item_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ProductListView),
    MaterialRoute(page: ProductItemView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiServiceService),
    LazySingleton(classType: ApiService),
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
