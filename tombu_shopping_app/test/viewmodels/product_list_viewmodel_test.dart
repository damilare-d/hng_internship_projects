import 'package:flutter_test/flutter_test.dart';
import 'package:tombu_shopping_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ProductListViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
