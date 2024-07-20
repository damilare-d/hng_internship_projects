import 'package:stacked/stacked.dart';
import 'package:stage_4_hng_app/models/product_model.dart';

class WishlistService with ListenableServiceMixin {
  final List<Product> _wishlist = [];

  List<Product> get wishlist => _wishlist;

  bool isWishlisted(Product product) {
    return _wishlist.contains(product);
  }

  void addToWishlist(Product product) {
    if (!isWishlisted(product)) {
      _wishlist.add(product);
      notifyListeners();
    }
  }

  void removeFromWishlist(Product product) {
    if (isWishlisted(product)) {
      _wishlist.remove(product);
      notifyListeners();
    }
  }

  void clearWishlist() {
    _wishlist.clear();
    notifyListeners();
  }
}
