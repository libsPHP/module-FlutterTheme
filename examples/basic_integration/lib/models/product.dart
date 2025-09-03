class Product {
  final int id;
  final String sku;
  final String name;
  final String? description;
  final double price;
  final double? specialPrice;
  final String? image;
  final String? thumbnail;
  final bool isInStock;
  final String type;
  final Map<String, dynamic>? attributes;

  Product({
    required this.id,
    required this.sku,
    required this.name,
    this.description,
    required this.price,
    this.specialPrice,
    this.image,
    this.thumbnail,
    required this.isInStock,
    required this.type,
    this.attributes,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      sku: json['sku'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      price: (json['price'] ?? 0.0).toDouble(),
      specialPrice: json['special_price'] != null 
          ? (json['special_price'] as num).toDouble() 
          : null,
      image: json['image'],
      thumbnail: json['thumbnail'],
      isInStock: json['is_in_stock'] ?? false,
      type: json['type_id'] ?? '',
      attributes: json['custom_attributes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'name': name,
      'description': description,
      'price': price,
      'special_price': specialPrice,
      'image': image,
      'thumbnail': thumbnail,
      'is_in_stock': isInStock,
      'type_id': type,
      'custom_attributes': attributes,
    };
  }

  double get finalPrice => specialPrice ?? price;
  
  bool get hasDiscount => specialPrice != null && specialPrice! < price;
  
  double get discountPercentage {
    if (!hasDiscount) return 0.0;
    return ((price - specialPrice!) / price * 100).roundToDouble();
  }
}
