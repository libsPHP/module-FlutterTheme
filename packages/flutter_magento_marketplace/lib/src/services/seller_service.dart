import 'package:flutter_magento_marketplace/src/core/magento_marketplace_client.dart';
import 'package:flutter_magento_marketplace/src/core/marketplace_exceptions.dart';
import 'package:flutter_magento_marketplace/src/models/seller.dart';

/// Service for managing seller-related operations
class SellerService {
  final MagentoMarketplaceClient _client;

  SellerService(this._client);

  /// Get all sellers with optional filters
  Future<SellerSearchResult> getSellers({
    SellerSearchFilters? filters,
    int pageSize = 20,
    int currentPage = 1,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'pageSize': pageSize,
        'currentPage': currentPage,
      };

      if (filters != null) {
        queryParams.addAll(filters.toJson());
      }

      final response = await _client.get(
        '/sellers',
        queryParameters: queryParams,
      );

      return SellerSearchResult.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw SellerException('Failed to get sellers: $e', error: e);
    }
  }

  /// Get seller by ID
  Future<Seller> getSeller(int sellerId) async {
    try {
      final response = await _client.get('/sellers/$sellerId');
      return Seller.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw SellerException('Failed to get seller: $e', error: e);
    }
  }

  /// Get seller by subdomain
  Future<Seller> getSellerBySubdomain(String subdomain) async {
    try {
      final response = await _client.get('/sellers/subdomain/$subdomain');
      return Seller.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw SellerException('Failed to get seller by subdomain: $e', error: e);
    }
  }

  /// Get seller by customer ID
  Future<Seller?> getSellerByCustomerId(int customerId) async {
    try {
      final response = await _client.get('/sellers/customer/$customerId');
      return Seller.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      if (e is MarketplaceNotFoundException) {
        return null;
      }
      throw SellerException(
        'Failed to get seller by customer ID: $e',
        error: e,
      );
    }
  }

  /// Register a new seller
  Future<Seller> registerSeller(SellerRegistrationRequest request) async {
    try {
      final response = await _client.post(
        '/sellers/register',
        data: request.toJson(),
      );
      return Seller.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw SellerException('Failed to register seller: $e', error: e);
    }
  }

  /// Update seller information
  Future<Seller> updateSeller(SellerUpdateRequest request) async {
    try {
      final response = await _client.put(
        '/sellers/${request.sellerId}',
        data: request.toJson(),
      );
      return Seller.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw SellerException('Failed to update seller: $e', error: e);
    }
  }

  /// Approve seller
  Future<bool> approveSeller(int sellerId) async {
    try {
      await _client.post('/sellers/$sellerId/approve');
      return true;
    } catch (e) {
      throw SellerException('Failed to approve seller: $e', error: e);
    }
  }

  /// Reject seller
  Future<bool> rejectSeller(int sellerId, {String? reason}) async {
    try {
      await _client.post(
        '/sellers/$sellerId/reject',
        data: reason != null ? {'reason': reason} : null,
      );
      return true;
    } catch (e) {
      throw SellerException('Failed to reject seller: $e', error: e);
    }
  }

  /// Suspend seller
  Future<bool> suspendSeller(int sellerId, {String? reason}) async {
    try {
      await _client.post(
        '/sellers/$sellerId/suspend',
        data: reason != null ? {'reason': reason} : null,
      );
      return true;
    } catch (e) {
      throw SellerException('Failed to suspend seller: $e', error: e);
    }
  }

  /// Activate seller
  Future<bool> activateSeller(int sellerId) async {
    try {
      await _client.post('/sellers/$sellerId/activate');
      return true;
    } catch (e) {
      throw SellerException('Failed to activate seller: $e', error: e);
    }
  }

  /// Get seller statistics
  Future<SellerStatistics> getSellerStatistics(int sellerId) async {
    try {
      final response = await _client.get('/sellers/$sellerId/statistics');
      return SellerStatistics.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw SellerException('Failed to get seller statistics: $e', error: e);
    }
  }

  /// Get featured sellers
  Future<List<Seller>> getFeaturedSellers({int limit = 10}) async {
    try {
      final response = await _client.get(
        '/sellers/featured',
        queryParameters: {'limit': limit},
      );
      return (response.data as List)
          .map((json) => Seller.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw SellerException('Failed to get featured sellers: $e', error: e);
    }
  }

  /// Get premium sellers
  Future<List<Seller>> getPremiumSellers({int limit = 10}) async {
    try {
      final response = await _client.get(
        '/sellers/premium',
        queryParameters: {'limit': limit},
      );
      return (response.data as List)
          .map((json) => Seller.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw SellerException('Failed to get premium sellers: $e', error: e);
    }
  }

  /// Search sellers by location
  Future<List<Seller>> searchSellersByLocation({
    required double latitude,
    required double longitude,
    double radius = 50.0, // in kilometers
    int limit = 20,
  }) async {
    try {
      final response = await _client.get(
        '/sellers/location',
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
          'radius': radius,
          'limit': limit,
        },
      );
      return (response.data as List)
          .map((json) => Seller.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw SellerException(
        'Failed to search sellers by location: $e',
        error: e,
      );
    }
  }

  /// Check if subdomain is available
  Future<bool> isSubdomainAvailable(String subdomain) async {
    try {
      final response = await _client.get(
        '/sellers/subdomain/check',
        queryParameters: {'subdomain': subdomain},
      );
      return response.data['available'] as bool;
    } catch (e) {
      throw SellerException(
        'Failed to check subdomain availability: $e',
        error: e,
      );
    }
  }

  /// Get seller's store URL
  String getSellerStoreUrl(Seller seller) {
    final baseUrl = _client.config.baseUrl;
    if (seller.subdomain != null && _client.config.enableSubdomains) {
      return 'https://${seller.subdomain}.${_extractDomain(baseUrl)}';
    } else if (_client.config.enableSubdirectories) {
      return '$baseUrl/seller/${seller.sellerId}';
    }
    return '$baseUrl/marketplace/seller/${seller.sellerId}';
  }

  /// Extract domain from URL
  String _extractDomain(String url) {
    final uri = Uri.parse(url);
    return uri.host;
  }
}

/// Seller search result
class SellerSearchResult {
  final List<Seller> items;
  final int totalCount;
  final int pageSize;
  final int currentPage;
  final int totalPages;

  const SellerSearchResult({
    required this.items,
    required this.totalCount,
    required this.pageSize,
    required this.currentPage,
    required this.totalPages,
  });

  factory SellerSearchResult.fromJson(Map<String, dynamic> json) {
    return SellerSearchResult(
      items: (json['items'] as List)
          .map((item) => Seller.fromJson(item as Map<String, dynamic>))
          .toList(),
      totalCount: json['total_count'] as int,
      pageSize: json['page_size'] as int,
      currentPage: json['current_page'] as int,
      totalPages: json['total_pages'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'total_count': totalCount,
      'page_size': pageSize,
      'current_page': currentPage,
      'total_pages': totalPages,
    };
  }
}

