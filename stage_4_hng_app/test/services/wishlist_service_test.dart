import 'package:flutter_test/flutter_test.dart';
import 'package:stage_4_hng_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('WishlistServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
