import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stage_4_hng_app/services/api_service.dart';
import 'package:stage_4_hng_app/services/app_service.dart';
import 'package:stage_4_hng_app/services/cart_service_service.dart';
import 'package:stage_4_hng_app/services/checkout_service.dart';
import 'package:stage_4_hng_app/services/product_detail_service.dart';
import 'package:stage_4_hng_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stage_4_hng_app/ui/bottom_sheets/payment/payment_sheet.dart';
import 'package:stage_4_hng_app/ui/bottom_sheets/product_add_to_cart/product_add_to_cart_sheet.dart';
import 'package:stage_4_hng_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stage_4_hng_app/ui/views/cart/cart_view.dart';
import 'package:stage_4_hng_app/ui/views/checkout/checkout_view.dart';
import 'package:stage_4_hng_app/ui/views/dashboard/dashboard_view.dart';
import 'package:stage_4_hng_app/ui/views/home/home_view.dart';
import 'package:stage_4_hng_app/ui/views/single_product/single_product_view.dart';
import 'package:stage_4_hng_app/ui/views/startup/startup_view.dart';
import 'package:stage_4_hng_app/ui/views/success/success_view.dart';
import 'package:stage_4_hng_app/services/order_service.dart';
import 'package:stage_4_hng_app/ui/views/order/orders_view.dart';
import 'package:stage_4_hng_app/ui/views/single_order/single_order_view.dart';
import 'package:stage_4_hng_app/ui/views/all_products/all_products_view.dart';
import 'package:stage_4_hng_app/services/wishlist_service.dart';
import 'package:stage_4_hng_app/ui/views/wishlist/wishlist_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: SingleProductView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: CheckoutView),
    MaterialRoute(page: SuccessView),
    MaterialRoute(page: OrdersView),
    MaterialRoute(page: SingleOrderView),
    MaterialRoute(page: AllProductsView),
    MaterialRoute(page: WishlistView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ProductDetailService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: CartServiceService),
    LazySingleton(classType: CheckoutService),
    LazySingleton(classType: AppService),
    LazySingleton(classType: OrderService),
    LazySingleton(classType: WishlistService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: PaymentSheet),
    StackedBottomsheet(classType: ProductAddToCartSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
