import 'package:flutter/foundation.dart';
import '../services/profile_service.dart';
import '../models/customer_models.dart';
import '../models/customer.dart' as customer_freezed;

/// Provider for managing customer profile state
class ProfileProvider extends ChangeNotifier {
  final ProfileService _profileService;

  ProfileProvider(this._profileService) {
    _profileService.addListener(_onProfileServiceChanged);
  }

  // Profile state getters
  bool get isLoading => _profileService.isLoading;
  String? get error => _profileService.error;
  customer_freezed.Customer? get currentProfile =>
      _profileService.currentProfile;
  List<CustomerAddress>? get addresses => _profileService.addresses;
  CustomerPreferences? get preferences => _profileService.preferences;
  CustomerStatistics? get statistics => _profileService.statistics;
  List<CustomerActivity>? get recentActivity => _profileService.recentActivity;
  CustomerLoyaltyPoints? get loyaltyPoints => _profileService.loyaltyPoints;
  List<CustomerSubscription>? get subscriptions =>
      _profileService.subscriptions;
  List<CustomerReview>? get reviews => _profileService.reviews;
  CustomerNotificationPreferences? get notificationPreferences =>
      _profileService.notificationPreferences;

  /// Load complete customer profile
  Future<bool> loadProfile() async {
    try {
      return await _profileService.loadProfile();
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error loading profile: $e');
      }
      return false;
    }
  }

  /// Update customer profile
  Future<bool> updateProfile({
    String? firstName,
    String? lastName,
    String? middleName,
    String? prefix,
    String? suffix,
    String? dateOfBirth,
    String? taxVat,
    String? gender,
    bool? isSubscribed,
  }) async {
    try {
      return await _profileService.updateProfile(
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        prefix: prefix,
        suffix: suffix,
        dateOfBirth: dateOfBirth,
        taxVat: taxVat,
        gender: gender,
        isSubscribed: isSubscribed,
      );
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error updating profile: $e');
      }
      return false;
    }
  }

  /// Add new address
  Future<bool> addAddress({
    required String firstName,
    required String lastName,
    required List<String> street,
    required String city,
    required String region,
    required String postcode,
    required String countryId,
    required String telephone,
    String? middleName,
    String? prefix,
    String? suffix,
    String? company,
    String? regionId,
    String? regionCode,
    String? fax,
    bool? isDefaultShipping,
    bool? isDefaultBilling,
    Map<String, dynamic>? customAttributes,
  }) async {
    try {
      return await _profileService.addAddress(
        firstName: firstName,
        lastName: lastName,
        street: street,
        city: city,
        region: region,
        postcode: postcode,
        countryId: countryId,
        telephone: telephone,
        middleName: middleName,
        prefix: prefix,
        suffix: suffix,
        company: company,
        regionId: regionId,
        regionCode: regionCode,
        fax: fax,
        isDefaultShipping: isDefaultShipping,
        isDefaultBilling: isDefaultBilling,
        customAttributes: customAttributes,
      );
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error adding address: $e');
      }
      return false;
    }
  }

  /// Update existing address
  Future<bool> updateAddress({
    required int addressId,
    String? firstName,
    String? lastName,
    List<String>? street,
    String? city,
    String? region,
    String? postcode,
    String? countryId,
    String? telephone,
    String? middleName,
    String? prefix,
    String? suffix,
    String? company,
    String? regionId,
    String? regionCode,
    String? fax,
    bool? isDefaultShipping,
    bool? isDefaultBilling,
    Map<String, dynamic>? customAttributes,
  }) async {
    try {
      return await _profileService.updateAddress(
        addressId: addressId,
        firstName: firstName,
        lastName: lastName,
        street: street,
        city: city,
        region: region,
        postcode: postcode,
        countryId: countryId,
        telephone: telephone,
        middleName: middleName,
        prefix: prefix,
        suffix: suffix,
        company: company,
        regionId: regionId,
        regionCode: regionCode,
        fax: fax,
        isDefaultShipping: isDefaultShipping,
        isDefaultBilling: isDefaultBilling,
        customAttributes: customAttributes,
      );
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error updating address: $e');
      }
      return false;
    }
  }

  /// Delete address
  Future<bool> deleteAddress(int addressId) async {
    try {
      return await _profileService.deleteAddress(addressId);
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error deleting address: $e');
      }
      return false;
    }
  }

  /// Update customer preferences
  Future<bool> updatePreferences({
    String? language,
    String? currency,
    String? timezone,
    bool? newsletterSubscription,
    Map<String, dynamic>? additionalPreferences,
  }) async {
    try {
      return await _profileService.updatePreferences(
        language: language,
        currency: currency,
        timezone: timezone,
        newsletterSubscription: newsletterSubscription,
        additionalPreferences: additionalPreferences,
      );
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error updating preferences: $e');
      }
      return false;
    }
  }

  /// Refresh all profile data
  Future<bool> refreshProfile() async {
    try {
      return await _profileService.refreshProfile();
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error refreshing profile: $e');
      }
      return false;
    }
  }

  /// Clear profile data
  void clearProfile() {
    _profileService.clearProfile();
  }

  /// Get profile summary for display
  Map<String, dynamic> get profileSummary => {
    'isLoaded': currentProfile != null,
    'fullName': currentProfile != null
        ? '${currentProfile!.firstname} ${currentProfile!.lastname}'
        : null,
    'email': currentProfile?.email,
    'addressCount': addresses?.length ?? 0,
    'totalOrders': statistics?.totalOrders ?? 0,
    'totalSpent': statistics?.totalSpent ?? 0.0,
    'loyaltyPoints': loyaltyPoints?.currentPoints ?? 0,
    'isSubscribed': currentProfile?.isSubscribed ?? false,
    'hasError': error != null,
    'error': error,
    'isLoading': isLoading,
  };

  /// Get address summary for display
  List<Map<String, dynamic>> get addressesSummary {
    if (addresses == null) return [];

    return addresses!
        .map(
          (address) => {
            'id': address.id,
            'displayName':
                '${address.firstName ?? ''} ${address.lastName ?? ''}',
            'fullAddress': _formatFullAddress(address),
            'isDefaultShipping': address.isDefaultShipping ?? false,
            'isDefaultBilling': address.isDefaultBilling ?? false,
            'telephone': address.telephone,
          },
        )
        .toList();
  }

  /// Format full address for display
  String _formatFullAddress(CustomerAddress address) {
    final parts = <String>[];

    if (address.street != null && address.street!.isNotEmpty) {
      parts.addAll(address.street!);
    }

    if (address.city != null) {
      parts.add(address.city!);
    }

    if (address.region != null) {
      parts.add(address.region!);
    }

    if (address.postcode != null) {
      parts.add(address.postcode!);
    }

    if (address.countryId != null) {
      parts.add(address.countryId!);
    }

    return parts.join(', ');
  }

  /// Handle profile service changes
  void _onProfileServiceChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _profileService.removeListener(_onProfileServiceChanged);
    super.dispose();
  }
}
