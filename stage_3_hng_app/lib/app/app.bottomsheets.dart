// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/payment/payment_sheet.dart';
import '../ui/bottom_sheets/product_add_to_cart/product_add_to_cart_sheet.dart';

enum BottomSheetType {
  notice,
  payment,
  productAddToCart,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.payment: (context, request, completer) =>
        PaymentSheet(request: request, completer: completer),
    BottomSheetType.productAddToCart: (context, request, completer) =>
        ProductAddToCartSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
