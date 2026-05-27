import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../mappers/seller_mapper.dart';
import '../models/seller.dart';
import '../models/seller_filter.dart';
import '../models/seller_review.dart';
import '../models/seller_sort.dart';
import '../models/seller_statistics.dart';
import '../queries/seller_queries.dart';
import 'seller_repository.dart';

/// Magento GraphQL implementation of [SellerRepository].
class MagentoSellerRepository implements SellerRepository {
  final MagentoTransport _transport;

  MagentoSellerRepository(this._transport);

  @override
  Future<SellerPage> getSellers({
    required int page,
    required int pageSize,
    SellerFilter? filter,
    SellerSort? sort,
  }) async {
    final variables = <String, dynamic>{
      'currentPage': page,
      'pageSize': pageSize,
    };

    if (filter != null && !filter.isEmpty) {
      variables['filter'] = _buildFilterInput(filter);
    }

    if (sort != null) {
      variables['sort'] = _buildSortInput(sort);
    }

    final response = await _transport.graphql(
      SellerQueries.getSellers,
      variables: variables,
      decoder: (json) => SellerMapper.pageFromGraphQl(json as Map<String, dynamic>),
    );

    return response.data;
  }

  @override
  Future<Seller> getSellerById(String sellerId) async {
    final response = await _transport.graphql(
      SellerQueries.getSellerById,
      variables: {'id': sellerId},
      decoder: (json) {
        final data = json as Map<String, dynamic>;
        final sellerData = data['marketplace_seller'] as Map<String, dynamic>?;
        if (sellerData == null) {
          throw MagentoNotFoundException('Seller not found: $sellerId');
        }
        return SellerMapper.fromGraphQl(sellerData);
      },
    );

    return response.data;
  }

  @override
  Future<Seller> getSellerByUrlKey(String urlKey) async {
    final response = await _transport.graphql(
      SellerQueries.getSellerByUrlKey,
      variables: {'urlKey': urlKey},
      decoder: (json) {
        final data = json as Map<String, dynamic>;
        final sellerData =
            data['marketplace_seller_by_url'] as Map<String, dynamic>?;
        if (sellerData == null) {
          throw MagentoNotFoundException('Seller not found: $urlKey');
        }
        return SellerMapper.fromGraphQl(sellerData);
      },
    );

    return response.data;
  }

  @override
  Future<List<Seller>> getFeaturedSellers({int limit = 10}) async {
    final response = await _transport.graphql(
      SellerQueries.getFeaturedSellers,
      variables: {'limit': limit},
      decoder: (json) {
        final data = json as Map<String, dynamic>;
        final sellers = data['marketplace_featured_sellers'] as List;
        return sellers
            .map((e) => SellerMapper.fromGraphQl(e as Map<String, dynamic>))
            .toList();
      },
    );

    return response.data;
  }

  @override
  Future<SellerStatistics> getSellerStatistics(String sellerId) async {
    final response = await _transport.graphql(
      SellerQueries.getSellerStatistics,
      variables: {'sellerId': sellerId},
      decoder: (json) {
        final data = json as Map<String, dynamic>;
        final statsData =
            data['marketplace_seller_statistics'] as Map<String, dynamic>;
        return SellerMapper.statisticsFromGraphQl(statsData);
      },
    );

    return response.data;
  }

  @override
  Future<SellerReviewPage> getSellerReviews({
    required String sellerId,
    required int page,
    required int pageSize,
  }) async {
    final response = await _transport.graphql(
      SellerQueries.getSellerReviews,
      variables: {
        'sellerId': sellerId,
        'currentPage': page,
        'pageSize': pageSize,
      },
      decoder: (json) =>
          SellerMapper.reviewPageFromGraphQl(json as Map<String, dynamic>),
    );

    return response.data;
  }

  @override
  Future<void> submitSellerReview({
    required String sellerId,
    required int rating,
    required String review,
    String? title,
  }) async {
    await _transport.graphql(
      SellerQueries.submitSellerReview,
      variables: {
        'sellerId': sellerId,
        'rating': rating,
        'review': review,
        'title': title,
      },
      decoder: (json) => json,
    );
  }

  Map<String, dynamic> _buildFilterInput(SellerFilter filter) {
    final input = <String, dynamic>{};

    if (filter.location != null) {
      input['location'] = {'eq': filter.location};
    }
    if (filter.minRating != null) {
      input['rating'] = {'gteq': filter.minRating};
    }
    if (filter.categoryIds != null && filter.categoryIds!.isNotEmpty) {
      input['category_ids'] = {'in': filter.categoryIds};
    }
    if (filter.verified != null) {
      input['is_verified'] = {'eq': filter.verified};
    }
    if (filter.featured != null) {
      input['featured'] = {'eq': filter.featured};
    }
    if (filter.query != null) {
      input['name'] = {'match': filter.query};
    }

    return input;
  }

  Map<String, dynamic> _buildSortInput(SellerSort sort) {
    final fieldName = switch (sort.field) {
      SellerSortField.name => 'name',
      SellerSortField.rating => 'rating',
      SellerSortField.productCount => 'product_count',
      SellerSortField.joinedAt => 'created_at',
      SellerSortField.reviewCount => 'review_count',
    };

    return {
      fieldName: sort.direction == SortDirection.asc ? 'ASC' : 'DESC',
    };
  }
}
