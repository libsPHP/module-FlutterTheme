/// Seller location information.
class SellerLocation {
  /// City name.
  final String? city;

  /// Region/state.
  final String? region;

  /// Country code (ISO 3166-1 alpha-2).
  final String countryCode;

  /// Full address.
  final String? address;

  /// Postal code.
  final String? postalCode;

  /// Latitude (for map display).
  final double? latitude;

  /// Longitude (for map display).
  final double? longitude;

  const SellerLocation({
    this.city,
    this.region,
    required this.countryCode,
    this.address,
    this.postalCode,
    this.latitude,
    this.longitude,
  });

  /// Display string for location.
  String get displayName {
    final parts = <String>[];
    if (city != null) parts.add(city!);
    if (region != null) parts.add(region!);
    parts.add(countryCode);
    return parts.join(', ');
  }

  /// Whether coordinates are available.
  bool get hasCoordinates => latitude != null && longitude != null;
}
