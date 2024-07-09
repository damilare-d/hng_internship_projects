import 'package:tombu_shopping_app/models/photo_model.dart';

class Product {
  final String name;
  final String description;
  final List<Photo> photos;
  final double currentPrice;

  Product({
    required this.name,
    required this.description,
    required this.photos,
    required this.currentPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      photos: json['photos'] == null
          ? []
          : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
      currentPrice: json['current_price'][0]['NGN'][0] ?? 0.0,
    );
  }

  // String get imageUrl {
  //   if (photos.isNotEmpty && photos[0] != null && photos[0]['url'] != null) {
  //     return "https://api.timbu.cloud/images/" + photos[0]['url'];
  //   }
  //   return 'assets/images/empty_img_placeholders.jpg';
  // }
}
