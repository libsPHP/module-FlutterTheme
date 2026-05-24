/// Simple Seller model for marketplace example
/// Uses plain Dart classes instead of freezed to avoid generation issues
class Seller {
  final int id;
  final String companyName;
  final String? description;
  final double rating;
  final int reviewCount;
  final int productCount;
  final String? logoUrl;
  final String? coverImageUrl;
  final bool featured;
  final bool premium;
  final SellerStatus status;
  final DateTime createdAt;

  Seller({
    required this.id,
    required this.companyName,
    this.description,
    required this.rating,
    required this.reviewCount,
    required this.productCount,
    this.logoUrl,
    this.coverImageUrl,
    this.featured = false,
    this.premium = false,
    required this.status,
    required this.createdAt,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      id: json['id'] ?? json['seller_id'] ?? 0,
      companyName: json['company_name'] ?? json['companyName'] ?? 'Unknown',
      description: json['description'],
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['review_count'] ?? json['reviewCount'] ?? 0,
      productCount: json['product_count'] ?? json['productCount'] ?? 0,
      logoUrl: json['logo_url'] ?? json['logoUrl'] ?? json['profile_image'],
      coverImageUrl: json['cover_image'] ?? json['coverImageUrl'],
      featured: json['featured'] ?? false,
      premium: json['premium'] ?? false,
      status: _parseStatus(json['status']),
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }

  static SellerStatus _parseStatus(dynamic status) {
    if (status is int) {
      return SellerStatus.values[status.clamp(0, 2)];
    }
    return SellerStatus.active;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_name': companyName,
      'description': description,
      'rating': rating,
      'review_count': reviewCount,
      'product_count': productCount,
      'logo_url': logoUrl,
      'cover_image': coverImageUrl,
      'featured': featured,
      'premium': premium,
      'status': status.index,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

enum SellerStatus { pending, active, suspended }

class SellerReview {
  final int id;
  final int sellerId;
  final String customerName;
  final double rating;
  final String comment;
  final DateTime createdAt;

  SellerReview({
    required this.id,
    required this.sellerId,
    required this.customerName,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  factory SellerReview.fromJson(Map<String, dynamic> json) {
    return SellerReview(
      id: json['id'] ?? 0,
      sellerId: json['seller_id'] ?? json['sellerId'] ?? 0,
      customerName:
          json['customer_name'] ?? json['customerName'] ?? 'Anonymous',
      rating: (json['rating'] ?? 0.0).toDouble(),
      comment: json['comment'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }
}

class SellerRegistrationRequest {
  final String companyName;
  final String email;
  final String phone;
  final String? description;
  final String? businessLicense;
  final String? taxId;

  SellerRegistrationRequest({
    required this.companyName,
    required this.email,
    required this.phone,
    this.description,
    this.businessLicense,
    this.taxId,
  });

  Map<String, dynamic> toJson() {
    return {
      'company_name': companyName,
      'email': email,
      'phone': phone,
      'description': description,
      'business_license': businessLicense,
      'tax_id': taxId,
    };
  }
}
