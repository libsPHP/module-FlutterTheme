import 'package:flutter/material.dart';

class AppConstants {
  // App Info
  static const String appName = 'Flutter Magento Marketplace';
  static const String appVersion = '1.0.0';
  static const String appDescription =
      'Multi-seller marketplace example demonstrating Flutter Magento capabilities';

  // Support
  static const String supportEmail = 'contact@nativemind.net';
  static const String supportPhone = '+1 (555) 123-4567';
  static const String supportHours = 'Mon-Fri, 9am-5pm EST';

  // Demo Credentials
  static const String demoEmail = 'test@scandipwa.com';
  static const String demoPassword = 'Test@123456';

  // Seller Registration
  static const int approvalDays = 3;
  static const double defaultCommissionRate = 0.10; // 10%

  // Limits
  static const int maxSearchResults = 100;
  static const int productsPerPage = 20;
  static const int reviewsPerPage = 10;

  // Colors
  static const Color featuredBadgeColor = Colors.orange;
  static const Color premiumBadgeColor = Colors.amber;
  static const Color activeBadgeColor = Colors.green;
  static const Color pendingBadgeColor = Colors.orange;
  static const Color suspendedBadgeColor = Colors.red;

  // Seller Status
  static const Map<String, String> sellerStatusLabels = {
    'pending': 'Pending Approval',
    'active': 'Active',
    'suspended': 'Suspended',
  };

  // API Endpoints (for reference)
  static const String apiSellersEndpoint = '/rest/V1/marketplace/sellers';
  static const String apiSellerDetailEndpoint =
      '/rest/V1/marketplace/sellers/{id}';
  static const String apiSellerProductsEndpoint =
      '/rest/V1/marketplace/sellers/{id}/products';
  static const String apiSellerReviewsEndpoint =
      '/rest/V1/marketplace/sellers/{id}/reviews';

  // Validation
  static const int minCompanyNameLength = 3;
  static const int maxCompanyNameLength = 100;
  static const int minDescriptionLength = 10;
  static const int maxDescriptionLength = 500;

  // Messages
  static const String successRegistration =
      'Thank you for your application. We will review it and get back to you within 2-3 business days.';
  static const String errorGeneric =
      'An error occurred. Please try again later.';
  static const String errorNetwork = 'Network error. Please check your connection.';
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

