import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/customer_models.dart';
import '../models/customer.dart' as customer_freezed;
import '../api/customer_api.dart';

/// Comprehensive profile service for managing customer profiles
class ProfileService extends ChangeNotifier {
  final CustomerApi _customerApi;

  bool _isLoading = false;
  String? _error;
  customer_freezed.Customer? _currentProfile;
  List<CustomerAddress>? _addresses;
  CustomerPreferences? _preferences;
  CustomerStatistics? _statistics;
  List<CustomerActivity>? _recentActivity;
  CustomerLoyaltyPoints? _loyaltyPoints;
  List<CustomerSubscription>? _subscriptions;
  List<CustomerReview>? _reviews;
  CustomerNotificationPreferences? _notificationPreferences;

  ProfileService(this._customerApi);

  // Getters
  bool get isLoading => _isLoading;
  String? get error => _error;
  customer_freezed.Customer? get currentProfile => _currentProfile;
  List<CustomerAddress>? get addresses => _addresses;
  CustomerPreferences? get preferences => _preferences;
  CustomerStatistics? get statistics => _statistics;
  List<CustomerActivity>? get recentActivity => _recentActivity;
  CustomerLoyaltyPoints? get loyaltyPoints => _loyaltyPoints;
  List<CustomerSubscription>? get subscriptions => _subscriptions;
  List<CustomerReview>? get reviews => _reviews;
  CustomerNotificationPreferences? get notificationPreferences =>
      _notificationPreferences;

  /// Load complete customer profile data
  Future<bool> loadProfile() async {
    _setLoading(true);
    _clearError();

    try {
      // Load basic profile
      _currentProfile = await _customerApi.getCustomerProfile();

      // Load additional profile data in parallel
      await Future.wait([
        _loadAddresses(),
        _loadPreferences(),
        _loadStatistics(),
        _loadRecentActivity(),
        _loadLoyaltyPoints(),
        _loadSubscriptions(),
        _loadReviews(),
        _loadNotificationPreferences(),
      ], eagerError: false);

      _setLoading(false);

      if (kDebugMode) {
        print('✅ Profile loaded successfully for: ${_currentProfile?.email}');
      }

      return true;
    } catch (e) {
      _setError('Failed to load profile: $e');
      _setLoading(false);
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
    _setLoading(true);
    _clearError();

    try {
      final updatedProfile = await _customerApi.updateCustomerProfile(
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

      _currentProfile = updatedProfile;
      _setLoading(false);

      if (kDebugMode) {
        print('✅ Profile updated successfully');
      }

      return true;
    } catch (e) {
      _setError('Failed to update profile: $e');
      _setLoading(false);
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
    _setLoading(true);
    _clearError();

    try {
      await _customerApi.addCustomerAddress(
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

      // Refresh addresses list
      await _loadAddresses();
      _setLoading(false);

      if (kDebugMode) {
        print('✅ Address added successfully');
      }

      return true;
    } catch (e) {
      _setError('Failed to add address: $e');
      _setLoading(false);
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
    _setLoading(true);
    _clearError();

    try {
      await _customerApi.updateCustomerAddress(
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

      // Refresh addresses list
      await _loadAddresses();
      _setLoading(false);

      if (kDebugMode) {
        print('✅ Address updated successfully');
      }

      return true;
    } catch (e) {
      _setError('Failed to update address: $e');
      _setLoading(false);
      return false;
    }
  }

  /// Delete address
  Future<bool> deleteAddress(int addressId) async {
    _setLoading(true);
    _clearError();

    try {
      await _customerApi.deleteCustomerAddress(addressId);

      // Refresh addresses list
      await _loadAddresses();
      _setLoading(false);

      if (kDebugMode) {
        print('✅ Address deleted successfully');
      }

      return true;
    } catch (e) {
      _setError('Failed to delete address: $e');
      _setLoading(false);
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
    _setLoading(true);
    _clearError();

    try {
      _preferences = await _customerApi.updateCustomerPreferences(
        language: language,
        currency: currency,
        timezone: timezone,
        newsletterSubscription: newsletterSubscription,
        additionalPreferences: additionalPreferences,
      );

      _setLoading(false);

      if (kDebugMode) {
        print('✅ Preferences updated successfully');
      }

      return true;
    } catch (e) {
      _setError('Failed to update preferences: $e');
      _setLoading(false);
      return false;
    }
  }

  /// Refresh all profile data
  Future<bool> refreshProfile() async {
    return await loadProfile();
  }

  /// Clear profile data
  void clearProfile() {
    _currentProfile = null;
    _addresses = null;
    _preferences = null;
    _statistics = null;
    _recentActivity = null;
    _loyaltyPoints = null;
    _subscriptions = null;
    _reviews = null;
    _notificationPreferences = null;
    _clearError();
    notifyListeners();
  }

  // Private helper methods
  Future<void> _loadAddresses() async {
    try {
      _addresses = await _customerApi.getCustomerAddresses();
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ Failed to load addresses: $e');
      }
    }
  }

  Future<void> _loadPreferences() async {
    try {
      _preferences = await _customerApi.getCustomerPreferences();
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ Failed to load preferences: $e');
      }
    }
  }

  Future<void> _loadStatistics() async {
    try {
      _statistics = await _customerApi.getCustomerStatistics();
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ Failed to load statistics: $e');
      }
    }
  }

  Future<void> _loadRecentActivity() async {
    try {
      _recentActivity = await _customerApi.getCustomerActivity(pageSize: 10);
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ Failed to load recent activity: $e');
      }
    }
  }

  Future<void> _loadLoyaltyPoints() async {
    try {
      // This would be implemented if the API supports loyalty points
      // For now, we'll create demo data
      _loyaltyPoints = const CustomerLoyaltyPoints(
        currentPoints: 150,
        totalEarned: 500,
        totalRedeemed: 350,
        pointsToExpire: 50,
        expirationDate: null,
      );
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ Failed to load loyalty points: $e');
      }
    }
  }

  Future<void> _loadSubscriptions() async {
    try {
      // This would be implemented if the API supports subscriptions
      _subscriptions = [];
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ Failed to load subscriptions: $e');
      }
    }
  }

  Future<void> _loadReviews() async {
    try {
      // This would be implemented if the API supports customer reviews
      _reviews = [];
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ Failed to load reviews: $e');
      }
    }
  }

  Future<void> _loadNotificationPreferences() async {
    try {
      // This would be implemented if the API supports notification preferences
      _notificationPreferences = const CustomerNotificationPreferences(
        emailNotifications: true,
        smsNotifications: false,
        pushNotifications: true,
        orderUpdates: true,
        promotionalOffers: true,
        productRecommendations: false,
        priceAlerts: true,
      );
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ Failed to load notification preferences: $e');
      }
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
    notifyListeners();
  }
}
