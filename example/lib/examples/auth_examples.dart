/// Authentication Examples
///
/// This file contains runnable examples for authentication features.
/// Run: flutter run lib/examples/auth_examples.dart
///
/// Based on: https://luma-demo.scandipwa.com/
/// Test credentials: test@scandipwa.com / Test@123456

import 'package:flutter/material.dart';
import 'package:flutter_magento/flutter_magento.dart';

void main() {
  runApp(const AuthExamplesApp());
}

class AuthExamplesApp extends StatelessWidget {
  const AuthExamplesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Examples',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const AuthExamplesScreen(),
    );
  }
}

class AuthExamplesScreen extends StatefulWidget {
  const AuthExamplesScreen({super.key});

  @override
  State<AuthExamplesScreen> createState() => _AuthExamplesScreenState();
}

class _AuthExamplesScreenState extends State<AuthExamplesScreen> {
  final _magento = FlutterMagentoCore.instance;
  String _output =
      'Ready to run examples...\n\nTest credentials:\nemail: test@scandipwa.com\npassword: Test@123456';
  bool _isLoading = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeMagento();
  }

  Future<void> _initializeMagento() async {
    setState(() {
      _isLoading = true;
      _output = 'Initializing Magento API...';
    });

    try {
      await _magento.initialize(baseUrl: 'https://luma-demo.scandipwa.com/');
      setState(() {
        _isInitialized = true;
        _output =
            '✅ Magento API initialized!\n\nReady to run examples.\n\nTest credentials:\nemail: test@scandipwa.com\npassword: Test@123456';
      });
    } catch (e) {
      setState(() {
        _output = '❌ Initialization error: $e';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  /// Example 1: Basic Login
  ///
  /// Demonstrates basic customer authentication with test credentials
  Future<void> example1_basicLogin() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Running: Basic Login...';
    });

    try {
      final authResponse = await _magento.authenticate(
        email: 'test@scandipwa.com',
        password: 'Test@123456',
      );

      setState(() {
        _output =
            '''
✅ Login Successful!

Customer: ${authResponse.customer.firstname} ${authResponse.customer.lastname}
Email: ${authResponse.customer.email}
Customer ID: ${authResponse.customer.id}
Token: ${authResponse.token.substring(0, 30)}...
''';
      });
    } catch (e) {
      setState(() {
        _output = '❌ Error: $e';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  /// Example 2: Customer Registration
  ///
  /// Demonstrates creating a new customer account
  Future<void> example2_customerRegistration() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Running: Customer Registration...';
    });

    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final newCustomer = await _magento.createAccount(
        email: 'test_$timestamp@example.com',
        password: 'SecurePass123!',
        firstName: 'Test',
        lastName: 'User',
      );

      setState(() {
        _output =
            '''
✅ Registration Successful!

Customer ID: ${newCustomer.id}
Name: ${newCustomer.firstname} ${newCustomer.lastname}
Email: ${newCustomer.email}
Created: ${newCustomer.createdAt}
''';
      });
    } catch (e) {
      setState(() {
        _output = '❌ Error: $e';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  /// Example 3: Get Current Customer
  ///
  /// Demonstrates fetching authenticated customer information
  Future<void> example3_getCurrentCustomer() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Running: Get Current Customer...\n\nFirst logging in...';
    });

    try {
      // First login
      await _magento.authenticate(
        email: 'test@scandipwa.com',
        password: 'Test@123456',
      );

      // Then get customer info
      final customer = await _magento.getCustomer();

      setState(() {
        _output =
            '''
✅ Customer Info Retrieved!

ID: ${customer.id}
Name: ${customer.firstname} ${customer.lastname}
Email: ${customer.email}
Created: ${customer.createdAt}
Store ID: ${customer.storeId}
Website ID: ${customer.websiteId}
''';
      });
    } catch (e) {
      setState(() {
        _output = '❌ Error: $e';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  /// Example 4: Check Authentication Status
  ///
  /// Demonstrates checking if user is authenticated
  Future<void> example4_checkAuthStatus() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Checking authentication status...';
    });

    try {
      final isAuthenticated = await _magento.isAuthenticated();

      setState(() {
        _output =
            '''
${isAuthenticated ? '✅' : '❌'} Authentication Status

Is Authenticated: $isAuthenticated

${isAuthenticated ? 'User is logged in' : 'User needs to login'}
''';
      });
    } catch (e) {
      setState(() {
        _output = '❌ Error: $e';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  /// Example 5: Logout
  ///
  /// Demonstrates customer logout
  Future<void> example5_logout() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Running: Logout...';
    });

    try {
      await _magento.logout();

      setState(() {
        _output = '✅ Logged out successfully!\n\nSession cleared.';
      });
    } catch (e) {
      setState(() {
        _output = '❌ Error: $e';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication Examples'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Output area
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: SingleChildScrollView(
                child: Text(
                  _output,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
                ),
              ),
            ),
          ),

          // Example buttons
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            )
          else
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: example1_basicLogin,
                    icon: const Icon(Icons.login),
                    label: const Text('1. Login'),
                  ),
                  ElevatedButton.icon(
                    onPressed: example2_customerRegistration,
                    icon: const Icon(Icons.person_add),
                    label: const Text('2. Register'),
                  ),
                  ElevatedButton.icon(
                    onPressed: example3_getCurrentCustomer,
                    icon: const Icon(Icons.person),
                    label: const Text('3. Get Customer'),
                  ),
                  ElevatedButton.icon(
                    onPressed: example4_checkAuthStatus,
                    icon: const Icon(Icons.check_circle),
                    label: const Text('4. Check Status'),
                  ),
                  ElevatedButton.icon(
                    onPressed: example5_logout,
                    icon: const Icon(Icons.logout),
                    label: const Text('5. Logout'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// ============================================================================
// Standalone Functions (for testing and quick reference)
// ============================================================================

/// Standalone example functions that can be called from tests
class AuthExamples {
  final FlutterMagentoCore magento;

  AuthExamples(this.magento);

  /// Example: Basic login
  Future<AuthResponse> basicLogin() async {
    return await magento.authenticate(
      email: 'test@scandipwa.com',
      password: 'Test@123456',
    );
  }

  /// Example: Create customer
  Future<Customer> createCustomer({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    return await magento.createAccount(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
  }

  /// Example: Get current customer
  Future<Customer> getCurrentCustomer() async {
    return await magento.getCustomer();
  }

  /// Example: Check if authenticated
  Future<bool> isAuthenticated() async {
    return await magento.isAuthenticated();
  }

  /// Example: Logout
  Future<void> logout() async {
    await magento.logout();
  }
}
