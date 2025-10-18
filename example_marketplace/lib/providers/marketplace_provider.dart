import 'package:flutter/foundation.dart';
import '../models/seller.dart';

class MarketplaceProvider with ChangeNotifier {
  List<Seller> _sellers = [];
  List<SellerReview> _reviews = [];
  bool _isLoading = false;
  String? _error;
  Seller? _selectedSeller;

  // Getters
  List<Seller> get sellers => _sellers;
  List<SellerReview> get reviews => _reviews;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Seller? get selectedSeller => _selectedSeller;

  // Featured sellers
  List<Seller> get featuredSellers =>
      _sellers.where((s) => s.featured).toList();

  // Premium sellers
  List<Seller> get premiumSellers => _sellers.where((s) => s.premium).toList();

  // Top rated sellers
  List<Seller> get topRatedSellers {
    final sorted = List<Seller>.from(_sellers);
    sorted.sort((a, b) => b.rating.compareTo(a.rating));
    return sorted.take(10).toList();
  }

  /// Load sellers (demo data for now)
  Future<void> loadSellers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Generate demo sellers
      _sellers = _generateDemoSellers();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Search sellers
  Future<List<Seller>> searchSellers(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (query.isEmpty) return _sellers;

    return _sellers
        .where(
          (seller) =>
              seller.companyName.toLowerCase().contains(query.toLowerCase()) ||
              (seller.description?.toLowerCase().contains(
                    query.toLowerCase(),
                  ) ??
                  false),
        )
        .toList();
  }

  /// Select seller for details
  void selectSeller(Seller seller) {
    _selectedSeller = seller;
    notifyListeners();
  }

  /// Load seller reviews
  Future<void> loadSellerReviews(int sellerId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      _reviews = _generateDemoReviews(sellerId);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Register new seller
  Future<bool> registerSeller(SellerRegistrationRequest request) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // In real app, make API call here
      // await marketplaceApi.registerSeller(request);

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  /// Generate demo sellers
  List<Seller> _generateDemoSellers() {
    return [
      Seller(
        id: 1,
        companyName: 'Electronics Hub',
        description:
            'Premium electronics store with latest gadgets and tech accessories',
        rating: 4.8,
        reviewCount: 1250,
        productCount: 456,
        logoUrl: 'https://via.placeholder.com/100',
        coverImageUrl: 'https://via.placeholder.com/400x200',
        featured: true,
        premium: true,
        status: SellerStatus.active,
        createdAt: DateTime.now().subtract(const Duration(days: 365)),
      ),
      Seller(
        id: 2,
        companyName: 'Fashion Boutique',
        description: 'Trendy clothing and accessories for modern lifestyle',
        rating: 4.6,
        reviewCount: 890,
        productCount: 320,
        logoUrl: 'https://via.placeholder.com/100',
        featured: true,
        premium: false,
        status: SellerStatus.active,
        createdAt: DateTime.now().subtract(const Duration(days: 200)),
      ),
      Seller(
        id: 3,
        companyName: 'Home & Garden',
        description: 'Everything for your home and garden needs',
        rating: 4.7,
        reviewCount: 650,
        productCount: 280,
        logoUrl: 'https://via.placeholder.com/100',
        featured: false,
        premium: true,
        status: SellerStatus.active,
        createdAt: DateTime.now().subtract(const Duration(days: 180)),
      ),
      Seller(
        id: 4,
        companyName: 'Sports Equipment Pro',
        description: 'Professional sports equipment and fitness gear',
        rating: 4.5,
        reviewCount: 420,
        productCount: 195,
        logoUrl: 'https://via.placeholder.com/100',
        featured: false,
        premium: false,
        status: SellerStatus.active,
        createdAt: DateTime.now().subtract(const Duration(days: 150)),
      ),
      Seller(
        id: 5,
        companyName: 'Books & More',
        description: 'Your favorite bookstore with vast collection',
        rating: 4.9,
        reviewCount: 1500,
        productCount: 850,
        logoUrl: 'https://via.placeholder.com/100',
        featured: true,
        premium: true,
        status: SellerStatus.active,
        createdAt: DateTime.now().subtract(const Duration(days: 500)),
      ),
      Seller(
        id: 6,
        companyName: 'Beauty & Cosmetics',
        description: 'Premium beauty products and cosmetics',
        rating: 4.4,
        reviewCount: 320,
        productCount: 145,
        logoUrl: 'https://via.placeholder.com/100',
        featured: false,
        premium: false,
        status: SellerStatus.active,
        createdAt: DateTime.now().subtract(const Duration(days: 90)),
      ),
      Seller(
        id: 7,
        companyName: 'Pet Supplies Store',
        description: 'Everything your pet needs in one place',
        rating: 4.6,
        reviewCount: 280,
        productCount: 210,
        logoUrl: 'https://via.placeholder.com/100',
        featured: false,
        premium: false,
        status: SellerStatus.active,
        createdAt: DateTime.now().subtract(const Duration(days: 120)),
      ),
      Seller(
        id: 8,
        companyName: 'Gourmet Foods',
        description: 'Artisan and gourmet food products',
        rating: 4.8,
        reviewCount: 560,
        productCount: 180,
        logoUrl: 'https://via.placeholder.com/100',
        featured: true,
        premium: false,
        status: SellerStatus.active,
        createdAt: DateTime.now().subtract(const Duration(days: 250)),
      ),
    ];
  }

  /// Generate demo reviews
  List<SellerReview> _generateDemoReviews(int sellerId) {
    return [
      SellerReview(
        id: 1,
        sellerId: sellerId,
        customerName: 'John Doe',
        rating: 5.0,
        comment: 'Excellent seller! Fast shipping and great products.',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
      SellerReview(
        id: 2,
        sellerId: sellerId,
        customerName: 'Jane Smith',
        rating: 4.0,
        comment: 'Good service, but delivery took a bit longer than expected.',
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
      ),
      SellerReview(
        id: 3,
        sellerId: sellerId,
        customerName: 'Mike Johnson',
        rating: 5.0,
        comment: 'Amazing quality! Will definitely buy again.',
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
      ),
      SellerReview(
        id: 4,
        sellerId: sellerId,
        customerName: 'Sarah Williams',
        rating: 4.5,
        comment: 'Very professional and responsive. Highly recommended!',
        createdAt: DateTime.now().subtract(const Duration(days: 20)),
      ),
    ];
  }

  /// Clear data
  void clear() {
    _sellers = [];
    _reviews = [];
    _selectedSeller = null;
    _error = null;
    notifyListeners();
  }
}
