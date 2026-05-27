/// Filter criteria for seller searches.
class SellerFilter {
  /// Filter by location/country.
  final String? location;

  /// Minimum rating.
  final double? minRating;

  /// Filter by category IDs.
  final List<String>? categoryIds;

  /// Only verified sellers.
  final bool? verified;

  /// Only featured sellers.
  final bool? featured;

  /// Search query.
  final String? query;

  const SellerFilter({
    this.location,
    this.minRating,
    this.categoryIds,
    this.verified,
    this.featured,
    this.query,
  });

  /// Creates an empty filter.
  const SellerFilter.empty()
      : location = null,
        minRating = null,
        categoryIds = null,
        verified = null,
        featured = null,
        query = null;

  /// Whether any filters are applied.
  bool get isEmpty =>
      location == null &&
      minRating == null &&
      (categoryIds == null || categoryIds!.isEmpty) &&
      verified == null &&
      featured == null &&
      query == null;

  /// Creates a copy with updated fields.
  SellerFilter copyWith({
    String? location,
    double? minRating,
    List<String>? categoryIds,
    bool? verified,
    bool? featured,
    String? query,
  }) {
    return SellerFilter(
      location: location ?? this.location,
      minRating: minRating ?? this.minRating,
      categoryIds: categoryIds ?? this.categoryIds,
      verified: verified ?? this.verified,
      featured: featured ?? this.featured,
      query: query ?? this.query,
    );
  }
}
