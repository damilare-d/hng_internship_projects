// lib/models/product.dart
class Product {
  final String? name;
  final String? description;
  final String? uniqueId;
  final String? urlSlug;
  final bool? isAvailable;
  final bool? isService;
  final String? id;
  final String? organizationId;
  final List<dynamic>? productImage;
  final List<dynamic>? categories;
  final String? dateCreated;
  final String? lastUpdated;
  final String? userId;
  final List<dynamic>? photos;
  final dynamic currentPrice;
  final bool? isDeleted;
  final double? availableQuantity;
  final dynamic sellingPrice;
  final dynamic discountedPrice;
  final dynamic buyingPrice;
  final dynamic extraInfos;

  Product({
    this.name,
    this.description,
    this.uniqueId,
    this.urlSlug,
    this.isAvailable,
    this.isService,
    this.id,
    this.organizationId,
    this.productImage,
    this.categories,
    this.dateCreated,
    this.lastUpdated,
    this.userId,
    this.photos,
    this.currentPrice,
    this.isDeleted,
    this.availableQuantity,
    this.sellingPrice,
    this.discountedPrice,
    this.buyingPrice,
    this.extraInfos,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] as String?,
      description: json['description'] as String?,
      uniqueId: json['unique_id'] as String?,
      urlSlug: json['url_slug'] as String?,
      isAvailable: json['is_available'] as bool?,
      isService: json['is_service'] as bool?,
      id: json['id'] as String?,
      organizationId: json['organization_id'] as String?,
      productImage: json['product_image'] as List<dynamic>?,
      categories: json['categories'] as List<dynamic>?,
      dateCreated: json['date_created'] as String?,
      lastUpdated: json['last_updated'] as String?,
      userId: json['user_id'] as String?,
      photos: json['photos'] as List<dynamic>?,
      currentPrice: json['current_price'],
      isDeleted: json['is_deleted'] as bool?,
      availableQuantity: json['available_quantity'] as double?,
      sellingPrice: json['selling_price'],
      discountedPrice: json['discounted_price'],
      buyingPrice: json['buying_price'],
      extraInfos: json['extra_infos'],
    );
  }
}
