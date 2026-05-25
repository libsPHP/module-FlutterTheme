/// Store context for multi-store Magento setup.
///
/// Contains store code, currency, locale, and other store-specific
/// configuration that affects API requests and data formatting.
class MagentoStoreContext {
  /// The Magento store code (e.g., 'default', 'en_us', 'de_de').
  final String storeCode;

  /// The website code (optional, for multi-website setups).
  final String? websiteCode;

  /// The currency code (e.g., 'USD', 'EUR').
  final String currency;

  /// The locale code (e.g., 'en_US', 'de_DE').
  final String locale;

  /// The customer group ID (optional).
  final String? customerGroupId;

  const MagentoStoreContext({
    required this.storeCode,
    this.websiteCode,
    required this.currency,
    required this.locale,
    this.customerGroupId,
  });

  /// Creates a default store context.
  const MagentoStoreContext.defaults()
      : storeCode = 'default',
        websiteCode = null,
        currency = 'USD',
        locale = 'en_US',
        customerGroupId = null;

  /// Creates a copy with the given fields replaced.
  MagentoStoreContext copyWith({
    String? storeCode,
    String? websiteCode,
    String? currency,
    String? locale,
    String? customerGroupId,
  }) {
    return MagentoStoreContext(
      storeCode: storeCode ?? this.storeCode,
      websiteCode: websiteCode ?? this.websiteCode,
      currency: currency ?? this.currency,
      locale: locale ?? this.locale,
      customerGroupId: customerGroupId ?? this.customerGroupId,
    );
  }

  /// Returns the language code from locale (e.g., 'en' from 'en_US').
  String get languageCode => locale.split('_').first;

  /// Returns the country code from locale (e.g., 'US' from 'en_US').
  String? get countryCode {
    final parts = locale.split('_');
    return parts.length > 1 ? parts[1] : null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MagentoStoreContext &&
          storeCode == other.storeCode &&
          websiteCode == other.websiteCode &&
          currency == other.currency &&
          locale == other.locale &&
          customerGroupId == other.customerGroupId;

  @override
  int get hashCode => Object.hash(
        storeCode,
        websiteCode,
        currency,
        locale,
        customerGroupId,
      );

  @override
  String toString() =>
      'MagentoStoreContext(store: $storeCode, currency: $currency, locale: $locale)';
}
