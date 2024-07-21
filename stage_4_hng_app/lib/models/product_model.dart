import 'package:stage_4_hng_app/models/category_model.dart';
import 'package:stage_4_hng_app/models/photo_model.dart';



class Product {
  final String name;
  final String? description;
  final List<Photo> photos;
  final double? currentPrice;
  final double? availableQuantity;
  final String? dateCreated;
  final double? buyingPrice;
  final double? sellingPrice;
  final List<Category> categories;

  Product({
    required this.name,
    this.description,
    required this.photos,
    this.currentPrice,
    this.availableQuantity,
    this.dateCreated,
    this.buyingPrice,
    this.sellingPrice,
    required this.categories,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? '',
      description: json['description'],
      photos: json['photos'] != null
          ? List<Photo>.from(json['photos'].map((x) => Photo.fromJson(x)))
          : [],
      currentPrice:
      json['current_price'] != null && json['current_price'].isNotEmpty
          ? (json['current_price'][0]['NGN'][0] as double?)
          : null,
      availableQuantity: json['available_quantity'],
      dateCreated: json['date_created'],
      buyingPrice: json['buying_price'],
      sellingPrice: json['selling_price'],
      categories: json['categories'] != null
          ? List<Category>.from(json['categories'].map((x) => Category.fromJson(x)))
          : [],
    );
  }
}
