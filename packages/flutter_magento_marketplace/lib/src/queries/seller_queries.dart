/// GraphQL queries for marketplace sellers.
class SellerQueries {
  SellerQueries._();

  /// Gets sellers with filters and pagination.
  static const String getSellers = r'''
    query GetSellers(
      $filter: SellerFilterInput
      $sort: SellerSortInput
      $pageSize: Int!
      $currentPage: Int!
    ) {
      marketplace_sellers(
        filter: $filter
        sort: $sort
        pageSize: $pageSize
        currentPage: $currentPage
      ) {
        items {
          id
          name
          url_key
          description
          logo_url
          banner_url
          rating
          review_count
          product_count
          is_verified
          vacation_mode
          created_at
          location {
            city
            region
            country_code
            address
            postal_code
            latitude
            longitude
          }
          social_links
          badges
        }
        total_count
        page_info {
          current_page
          page_size
          total_pages
        }
      }
    }
  ''';

  /// Gets a seller by ID.
  static const String getSellerById = r'''
    query GetSellerById($id: String!) {
      marketplace_seller(id: $id) {
        id
        name
        url_key
        description
        logo_url
        banner_url
        rating
        review_count
        product_count
        is_verified
        vacation_mode
        created_at
        location {
          city
          region
          country_code
          address
          postal_code
          latitude
          longitude
        }
        social_links
        badges
        statistics {
          total_orders
          completed_orders
          fulfillment_rate
          avg_shipping_time
          total_sales {
            value
            currency
          }
          commission_rate
          return_rate
          response_time
        }
      }
    }
  ''';

  /// Gets a seller by URL key.
  static const String getSellerByUrlKey = r'''
    query GetSellerByUrlKey($urlKey: String!) {
      marketplace_seller_by_url(url_key: $urlKey) {
        id
        name
        url_key
        description
        logo_url
        banner_url
        rating
        review_count
        product_count
        is_verified
        vacation_mode
        created_at
        location {
          city
          region
          country_code
          address
          postal_code
          latitude
          longitude
        }
        social_links
        badges
      }
    }
  ''';

  /// Gets featured sellers.
  static const String getFeaturedSellers = r'''
    query GetFeaturedSellers($limit: Int!) {
      marketplace_featured_sellers(limit: $limit) {
        id
        name
        url_key
        description
        logo_url
        rating
        review_count
        product_count
        is_verified
        location {
          city
          country_code
        }
      }
    }
  ''';

  /// Gets seller statistics.
  static const String getSellerStatistics = r'''
    query GetSellerStatistics($sellerId: String!) {
      marketplace_seller_statistics(seller_id: $sellerId) {
        total_orders
        completed_orders
        fulfillment_rate
        avg_shipping_time
        total_sales {
          value
          currency
        }
        commission_rate
        return_rate
        response_time
      }
    }
  ''';

  /// Gets seller reviews.
  static const String getSellerReviews = r'''
    query GetSellerReviews(
      $sellerId: String!
      $pageSize: Int!
      $currentPage: Int!
    ) {
      marketplace_seller_reviews(
        seller_id: $sellerId
        pageSize: $pageSize
        currentPage: $currentPage
      ) {
        items {
          id
          customer_id
          customer_name
          rating
          title
          review
          created_at
          order_id
          is_verified_purchase
        }
        total_count
        page_info {
          current_page
          page_size
        }
      }
    }
  ''';

  /// Submits a seller review.
  static const String submitSellerReview = r'''
    mutation SubmitSellerReview(
      $sellerId: String!
      $rating: Int!
      $review: String!
      $title: String
    ) {
      submitMarketplaceSellerReview(
        input: {
          seller_id: $sellerId
          rating: $rating
          review: $review
          title: $title
        }
      ) {
        success
        message
      }
    }
  ''';
}
