import 'package:flutter_magento/flutter_magento.dart';
import 'package:flutter_magento/src/models/cart_models.dart';

/// Examples of how to use the Flutter Magento library
class MagentoUsageExamples {
  
  /// Example: Initialize the library
  static Future<void> initializeExample() async {
    try {
      final magento = FlutterMagento();
      
      final success = await magento.initialize(
        baseUrl: 'https://your-magento-store.com',
        headers: {
          'User-Agent': 'FlutterMagento/1.0.0',
        },
        connectionTimeout: 30000,
        receiveTimeout: 30000,
      );
      
      if (success) {
        print('✅ Magento library initialized successfully');
      } else {
        print('❌ Failed to initialize Magento library');
      }
    } catch (e) {
      print('❌ Error initializing Magento: $e');
    }
  }
  
  /// Example: Customer authentication
  static Future<void> authenticationExample() async {
    try {
      final magento = FlutterMagento();
      
      // Check if already authenticated
      if (magento.isAuthenticated) {
        print('✅ User is already authenticated');
        final currentCustomer = await magento.getCurrentCustomer();
        print('👤 Current customer: ${currentCustomer.email}');
        return;
      }
      
      // Authenticate customer
      final customer = await magento.authenticateCustomer(
        email: 'customer@example.com',
        password: 'password123',
      );
      
      if (customer != null) {
        print('✅ Authentication successful');
        print('👤 Customer: ${customer.firstname} ${customer.lastname}');
        print('📧 Email: ${customer.email}');
      }
    } catch (e) {
      print('❌ Authentication failed: $e');
    }
  }
  
  /// Example: Create customer account
  static Future<void> createAccountExample() async {
    try {
      final magento = FlutterMagento();
      
      final customer = await magento.createCustomer(
        email: 'newcustomer@example.com',
        password: 'StrongPassword123!',
        firstName: 'John',
        lastName: 'Doe',
        dateOfBirth: '1990-01-01',
      );
      
      if (customer != null) {
        print('✅ Account created successfully');
        print('👤 Customer ID: ${customer.id}');
        print('📧 Email: ${customer.email}');
      }
    } catch (e) {
      print('❌ Failed to create account: $e');
    }
  }
  
  /// Example: Get products
  static Future<void> getProductsExample() async {
    try {
      final magento = FlutterMagento();
      
      // Get products with pagination and filters
      final products = await magento.getProducts(
        page: 1,
        pageSize: 20,
        searchQuery: 'shirt',
        categoryId: '15',
        sortBy: 'price',
        sortOrder: 'ASC',
        filters: {
          'price': {
            'from': '10.00',
            'to': '100.00',
          },
          'color': 'blue',
        },
      );
      
      if (products != null) {
        print('✅ Products retrieved successfully');
        print('📦 Total products: ${products.totalCount}');
        print('📄 Current page: ${products.currentPage}');
        
        for (final product in products.items) {
          print('🛍️ ${product.name} - \$${product.price}');
        }
      }
    } catch (e) {
      print('❌ Failed to get products: $e');
    }
  }
  
  /// Example: Search products
  static Future<void> searchProductsExample() async {
    try {
      final magento = FlutterMagento();
      
      final searchResults = await magento.searchProducts(
        'wireless headphones',
        page: 1,
        pageSize: 10,
      );
      
      if (searchResults != null) {
        print('✅ Search completed successfully');
        print('🔍 Query: wireless headphones');
        print('📦 Found: ${searchResults.totalCount} products');
        
        for (final product in searchResults.items) {
          print('🎧 ${product.name} - \$${product.price}');
        }
      }
    } catch (e) {
      print('❌ Search failed: $e');
    }
  }
  
  /// Example: Cart operations
  static Future<void> cartOperationsExample() async {
    try {
      final magento = FlutterMagento();
      
      // Create cart
      final cartId = await magento.createCart();
      print('🛒 Cart created with ID: $cartId');
      
      // Add product to cart
      final cart = await magento.getCustomerCart();
      final added = await magento.addToCart(
        cartId: cart.id.toString(),
        sku: 'SHIRT-001',
        quantity: 2,
        productOptions: {
          'color': 'blue',
          'size': 'M',
        },
      );
      
      if (added) {
        print('✅ Product added to cart');
        
        // Get cart information
        final cartInfo = await magento.getCart(cart.id.toString());
        if (cartInfo != null) {
          print('🛒 Cart total: \$${cartInfo.grandTotal}');
          print('📦 Items in cart: ${cartInfo.items.length}');
          
          for (final item in cartInfo.items) {
            print('  - ${item.name} x${item.quantity} - \$${item.price}');
          }
        }
        
        // Update quantity
        final updated = await magento.updateCartItemQuantity(
          cartId: cart.id.toString(),
          itemId: 1,
          quantity: 3,
        );
        
        if (updated) {
          print('✅ Quantity updated');
        }
        
        // Apply coupon
        final couponApplied = await magento.applyCoupon(
          cartId: cart.id.toString(),
          couponCode: 'SAVE20',
        );
        if (couponApplied) {
          print('✅ Coupon applied');
        }
      }
    } catch (e) {
      print('❌ Cart operation failed: $e');
    }
  }
  
  /// Example: Get customer orders
  static Future<void> getOrdersExample() async {
    try {
      final magento = FlutterMagento();
      
      final orders = await magento.getCustomerOrders();
      
      if (orders != null && orders.isNotEmpty) {
        print('✅ Orders retrieved successfully');
        print('📋 Total orders: ${orders.length}');
        
        for (final order in orders) {
          print('📦 Order #${order.incrementId}');
          print('   Status: ${order.status}');
          print('   Total: \$${order.grandTotal}');
          print('   Date: ${order.createdAt}');
          print('---');
        }
      } else {
        print('📭 No orders found');
      }
    } catch (e) {
      print('❌ Failed to get orders: $e');
    }
  }
  
  /// Example: Wishlist operations
  static Future<void> wishlistOperationsExample() async {
    try {
      final magento = FlutterMagento();
      
      // Get wishlist
      final wishlist = await magento.getWishlist();
      
      if (wishlist != null) {
        print('✅ Wishlist retrieved');
        print('💝 Items in wishlist: ${wishlist.items?.length ?? 0}');
      }
      
      // Add product to wishlist
      final added = await magento.addToWishlist(
        wishlistId: wishlist?.id ?? '1',
        productId: 'SHIRT-001',
      );
      if (added == true) {
        print('✅ Product added to wishlist');
      }
      
      // Remove product from wishlist
      final removed = await magento.removeFromWishlist(
        itemId: 1,
        wishlistId: wishlist?.id ?? '1',
      );
      if (removed == true) {
        print('✅ Product removed from wishlist');
      }
    } catch (e) {
      print('❌ Wishlist operation failed: $e');
    }
  }
  
  /// Example: Checkout process
  static Future<void> checkoutExample() async {
    try {
      final magento = FlutterMagento();
      
      // Get or create cart first
      final cart = await magento.getCustomerCart();
      
      // Create address object
      final address = Address(
        regionId: '12',
        region: 'California',
        countryId: 'US',
        postcode: '90210',
        city: 'Beverly Hills',
        street: ['123 Main St'],
      );
      
      // Estimate shipping
      final shippingMethods = await magento.estimateShipping(
        cartId: cart.id.toString(),
        address: address,
      );
      
      if (shippingMethods.isNotEmpty) {
        print('✅ Shipping methods available:');
        for (final method in shippingMethods) {
          print('🚚 ${method.title} - \$${method.amount}');
        }
      }
      
      // Get payment methods
      final paymentMethods = await magento.getAvailablePaymentMethods(
        cartId: cart.id.toString(),
        address: address.toJson(),
      );
      
      if (paymentMethods.isNotEmpty) {
        print('✅ Payment methods available:');
        for (final method in paymentMethods) {
          print('💳 ${method.title}');
        }
      }
      
      // Place order (example data)
      final orderData = {
        'paymentMethod': {
          'method': 'checkmo',
        },
        'billing_address': {
          'region_id': '12',
          'region': 'California',
          'country_id': 'US',
          'postcode': '90210',
          'city': 'Beverly Hills',
          'street': ['123 Main St'],
          'firstname': 'John',
          'lastname': 'Doe',
          'telephone': '+1234567890',
        },
        'shipping_address': {
          'region_id': '12',
          'region': 'California',
          'country_id': 'US',
          'postcode': '90210',
          'city': 'Beverly Hills',
          'street': ['123 Main St'],
          'firstname': 'John',
          'lastname': 'Doe',
          'telephone': '+1234567890',
        },
      };
      
      // Note: This would actually place the order
      // final order = await magento.placeOrder(orderData);
      print('📋 Order data prepared (not actually placed)');
      
    } catch (e) {
      print('❌ Checkout process failed: $e');
    }
  }
  
  /// Example: Complete workflow
  static Future<void> completeWorkflowExample() async {
    try {
      final magento = FlutterMagento();
      
      print('🚀 Starting complete Magento workflow...');
      
      // 1. Initialize
      await initializeExample();
      
      // 2. Authenticate
      await authenticationExample();
      
      // 3. Browse products
      await getProductsExample();
      
      // 4. Search products
      await searchProductsExample();
      
      // 5. Cart operations
      await cartOperationsExample();
      
      // 6. Wishlist operations
      await wishlistOperationsExample();
      
      // 7. View orders
      await getOrdersExample();
      
      // 8. Checkout process
      await checkoutExample();
      
      print('✅ Complete workflow finished successfully!');
      
    } catch (e) {
      print('❌ Workflow failed: $e');
    }
  }
  
  /// Example: Error handling
  static Future<void> errorHandlingExample() async {
    try {
      final magento = FlutterMagento();
      
      // Try to use library without initialization
      try {
        await magento.getProducts();
      } catch (e) {
        print('✅ Caught expected error: $e');
      }
      
      // Initialize library
      await magento.initialize(baseUrl: 'https://invalid-url.com');
      
      // Try to authenticate with invalid credentials
      try {
        await magento.authenticateCustomer(
          email: 'invalid@email.com',
          password: 'wrongpassword',
        );
      } catch (e) {
        print('✅ Caught authentication error: $e');
      }
      
    } catch (e) {
      print('❌ Unexpected error: $e');
    }
  }
}
