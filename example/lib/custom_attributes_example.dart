import 'package:flutter/material.dart';
import 'package:flutter_magento/flutter_magento.dart';
import 'package:flutter_magento/src/examples/ar_attributes_adapter.dart';
import 'package:flutter_magento/src/examples/fashion_attributes_adapter.dart';

/// Example demonstrating the Universal Custom Attributes System
///
/// This example shows how different applications can use their own
/// custom attributes without modifying the flutter_magento library.
class CustomAttributesExample extends StatefulWidget {
  const CustomAttributesExample({Key? key}) : super(key: key);

  @override
  State<CustomAttributesExample> createState() =>
      _CustomAttributesExampleState();
}

class _CustomAttributesExampleState extends State<CustomAttributesExample> {
  final FlutterMagento _magento = FlutterMagento();
  bool _isInitialized = false;
  String _status = 'Not initialized';

  @override
  void initState() {
    super.initState();
    _initializeMagento();
  }

  Future<void> _initializeMagento() async {
    setState(() {
      _status = 'Initializing...';
    });

    try {
      // Create custom adapters
      final arAdapter = SamskaraARAdapter();
      final fashionAdapter = FashionAttributesAdapter();

      // Initialize FlutterMagento with custom adapters
      final success = await _magento.initialize(
        baseUrl: 'https://demo-magento.com', // Replace with your Magento URL
        customAdapters: [arAdapter, fashionAdapter],
        enableCustomAttributesDebugLogging: true,
      );

      if (success) {
        setState(() {
          _isInitialized = true;
          _status =
              'Initialized with ${_magento.registeredAdapters.length} custom adapters';
        });
      } else {
        setState(() {
          _status = 'Failed to initialize';
        });
      }
    } catch (e) {
      setState(() {
        _status = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Attributes Example'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusCard(),
            const SizedBox(height: 20),
            if (_isInitialized) ...[
              _buildAdapterInfoCard(),
              const SizedBox(height: 20),
              _buildExampleButtons(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Initialization Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(_status),
            if (_isInitialized) ...[
              const SizedBox(height: 8),
              Text(
                  'Debug logging: ${_magento.customAttributesManager.enableDebugLogging}'),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAdapterInfoCard() {
    final adapters = _magento.registeredAdapters;
    final statistics = _magento.customAttributesStatistics;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Registered Adapters',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...adapters.entries.map((entry) => Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text('• ${entry.key}: ${entry.value.runtimeType}'),
                )),
            const SizedBox(height: 12),
            const Text(
              'Statistics',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('Total adapters: ${statistics['totalAdapters']}'),
            Text('Mapped attributes: ${statistics['totalMappedAttributes']}'),
            Text(
                'Average attributes per adapter: ${statistics['averageAttributesPerAdapter']}'),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Examples',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ElevatedButton(
              onPressed: _demonstrateARExample,
              child: const Text('AR Products Example'),
            ),
            ElevatedButton(
              onPressed: _demonstrateFashionExample,
              child: const Text('Fashion Products Example'),
            ),
            ElevatedButton(
              onPressed: _demonstrateAutoDetection,
              child: const Text('Auto-Detection Example'),
            ),
            ElevatedButton(
              onPressed: _demonstrateValidation,
              child: const Text('Validation Example'),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _demonstrateARExample() async {
    _showDialog('AR Products Example', () async {
      try {
        // Example: Get AR products with specific filters
        final arProducts =
            await _magento.enhancedProducts.getEnhancedProducts<ARAttributes>(
          adapterId: 'samskara_ar',
          page: 1,
          pageSize: 10,
          customAttributeFilters: {
            'orientation': 'portrait',
            'average_rating': {'gteq': '4.0'},
          },
        );

        final results = <String>[];
        results.add('Found ${arProducts.items.length} AR products');

        for (final product in arProducts.items.take(3)) {
          results.add('\n--- ${product.baseProduct.name} ---');

          if (product.customData != null) {
            final arData = product.customData!;
            results.add('Model: ${arData.modelPath ?? 'N/A'}');
            results.add('Artist: ${arData.artistName ?? 'Unknown'}');
            results.add('Rating: ${arData.averageRating ?? 0.0}/5.0');
            results.add('Views: ${arData.viewCount ?? 0}');
            results.add('Valid AR Model: ${arData.isValidARModel}');
            results.add('Has Audio: ${arData.hasAudio}');
            results.add(
                'Popularity Score: ${arData.popularityScore.toStringAsFixed(1)}');
          }

          // Demonstrate validation
          if (product.hasAdapter) {
            results.add(
                'Validation: ${product.isCustomDataValid ? 'Valid' : 'Invalid'}');
            if (!product.isCustomDataValid) {
              results.add(
                  'Errors: ${product.customDataValidationErrors.join(', ')}');
            }
          }
        }

        return results.join('\n');
      } catch (e) {
        return 'Error: $e';
      }
    });
  }

  Future<void> _demonstrateFashionExample() async {
    _showDialog('Fashion Products Example', () async {
      try {
        // Example: Get fashion products with specific filters
        final fashionProducts = await _magento.enhancedProducts
            .getEnhancedProducts<FashionAttributes>(
          adapterId: 'fashion',
          page: 1,
          pageSize: 10,
          customAttributeFilters: {
            'gender': 'unisex',
            'is_eco_friendly': 'true',
            'discount': {'gt': '0'},
          },
        );

        final results = <String>[];
        results.add('Found ${fashionProducts.items.length} fashion products');

        for (final product in fashionProducts.items.take(3)) {
          results.add('\n--- ${product.baseProduct.name} ---');

          if (product.customData != null) {
            final fashionData = product.customData!;
            results.add('Color: ${fashionData.color ?? 'N/A'}');
            results.add('Size: ${fashionData.size ?? 'N/A'}');
            results.add('Brand: ${fashionData.brand ?? 'Unknown'}');
            results.add('Material: ${fashionData.material ?? 'N/A'}');
            results.add('Discount: ${fashionData.discount ?? 0}%');
            results.add('Eco-friendly: ${fashionData.isEcoFriendly ?? false}');
            results.add('Premium: ${fashionData.isPremium}');
            results.add('Sustainable: ${fashionData.isSustainable}');

            if (fashionData.hasDiscount && fashionData.originalPrice != null) {
              results.add('Original price: \$${fashionData.originalPrice}');
              results.add('Discounted price: \$${fashionData.discountedPrice}');
            }

            if (fashionData.availableSizes != null) {
              results.add(
                  'Available sizes: ${fashionData.availableSizes!.join(', ')}');
            }

            results.add('Care complexity: ${fashionData.careComplexity}');
          }
        }

        return results.join('\n');
      } catch (e) {
        return 'Error: $e';
      }
    });
  }

  Future<void> _demonstrateAutoDetection() async {
    _showDialog('Auto-Detection Example', () async {
      try {
        // Example: Get products and let the system auto-detect adapters
        final products =
            await _magento.enhancedProducts.getProductsWithMultipleAdapters(
          page: 1,
          pageSize: 5,
        );

        final results = <String>[];
        results.add('Auto-detection results:');
        results.add('Found ${products.items.length} products\n');

        final adapterUsage = <String, int>{};

        for (final product in products.items) {
          results.add('--- ${product.baseProduct.name} ---');

          if (product.adapterId != null) {
            results.add('Detected adapter: ${product.adapterId}');
            adapterUsage[product.adapterId!] =
                (adapterUsage[product.adapterId!] ?? 0) + 1;

            // Show some custom data based on adapter type
            if (product.adapterId == 'samskara_ar' &&
                product.customData is ARAttributes) {
              final arData = product.customData as ARAttributes;
              results
                  .add('AR Model: ${arData.modelPath != null ? 'Yes' : 'No'}');
              results.add('Artist: ${arData.artistName ?? 'Unknown'}');
            } else if (product.adapterId == 'fashion' &&
                product.customData is FashionAttributes) {
              final fashionData = product.customData as FashionAttributes;
              results.add('Color: ${fashionData.color ?? 'N/A'}');
              results.add('Brand: ${fashionData.brand ?? 'Unknown'}');
            }
          } else {
            results.add('No suitable adapter found');
            adapterUsage['no_adapter'] = (adapterUsage['no_adapter'] ?? 0) + 1;
          }

          results.add(
              'Raw attributes: ${product.rawCustomAttributes.keys.length}');
          results.add('');
        }

        results.add('Adapter usage statistics:');
        adapterUsage.forEach((adapter, count) {
          results.add('$adapter: $count products');
        });

        return results.join('\n');
      } catch (e) {
        return 'Error: $e';
      }
    });
  }

  Future<void> _demonstrateValidation() async {
    _showDialog('Validation Example', () async {
      try {
        final results = <String>[];

        // Example 1: Valid AR attributes
        const validAR = ARAttributes(
          modelPath: 'https://example.com/model.glb',
          arWidth: 0.5,
          arHeight: 0.3,
          averageRating: 4.5,
          viewCount: 100,
          orientation: 'portrait',
        );

        final arAdapter = SamskaraARAdapter();
        final validARResult = arAdapter.validate(validAR);

        results.add('=== AR Validation Examples ===\n');
        results.add('Valid AR attributes:');
        results.add('Is valid: ${validARResult.isValid}');
        results.add(
            'Errors: ${validARResult.errors.isEmpty ? 'None' : validARResult.errors.join(', ')}');
        results.add(
            'Warnings: ${validARResult.warnings.isEmpty ? 'None' : validARResult.warnings.join(', ')}');

        // Example 2: Invalid AR attributes
        const invalidAR = ARAttributes(
          modelPath: 'invalid-file.txt', // Wrong extension
          arWidth: -1.0, // Negative width
          averageRating: 6.0, // Rating > 5
          viewCount: -10, // Negative count
          orientation: 'invalid', // Invalid orientation
        );

        final invalidARResult = arAdapter.validate(invalidAR);

        results.add('\nInvalid AR attributes:');
        results.add('Is valid: ${invalidARResult.isValid}');
        results.add('Errors: ${invalidARResult.errors.join('\n  - ')}');

        // Example 3: Valid fashion attributes
        const validFashion = FashionAttributes(
          color: 'blue',
          size: 'M',
          discount: 25.0,
          gender: 'unisex',
          yearReleased: 2023,
          originalPrice: 100.0,
        );

        final fashionAdapter = FashionAttributesAdapter();
        final validFashionResult = fashionAdapter.validate(validFashion);

        results.add('\n=== Fashion Validation Examples ===\n');
        results.add('Valid fashion attributes:');
        results.add('Is valid: ${validFashionResult.isValid}');
        results.add(
            'Errors: ${validFashionResult.errors.isEmpty ? 'None' : validFashionResult.errors.join(', ')}');
        results.add(
            'Warnings: ${validFashionResult.warnings.isEmpty ? 'None' : validFashionResult.warnings.join(', ')}');

        // Example 4: Invalid fashion attributes
        const invalidFashion = FashionAttributes(
          discount: 150.0, // > 100%
          gender: 'invalid_gender',
          yearReleased: 1800, // Too old
          weight: -10.0, // Negative weight
          originalPrice: -50.0, // Negative price
        );

        final invalidFashionResult = fashionAdapter.validate(invalidFashion);

        results.add('\nInvalid fashion attributes:');
        results.add('Is valid: ${invalidFashionResult.isValid}');
        results.add('Errors: ${invalidFashionResult.errors.join('\n  - ')}');

        return results.join('\n');
      } catch (e) {
        return 'Error: $e';
      }
    });
  }

  void _showDialog(String title, Future<String> Function() contentProvider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: FutureBuilder<String>(
          future: contentProvider(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 100,
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return SingleChildScrollView(
                child: Text(
                  snapshot.data ?? 'No data',
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                ),
              );
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

/// Standalone example functions that can be used in any Flutter app
class CustomAttributesExamples {
  static final FlutterMagento _magento = FlutterMagento();

  /// Initialize FlutterMagento with AR and Fashion adapters
  static Future<bool> initializeWithCustomAdapters() async {
    final arAdapter = SamskaraARAdapter();
    final fashionAdapter = FashionAttributesAdapter();

    return await _magento.initialize(
      baseUrl: 'https://your-magento-store.com',
      customAdapters: [arAdapter, fashionAdapter],
      enableCustomAttributesDebugLogging: true,
    );
  }

  /// Example: Working with AR products (Samskara-like app)
  static Future<void> arProductsExample() async {
    // Get AR products with specific filters
    final arProducts =
        await _magento.enhancedProducts.getEnhancedProducts<ARAttributes>(
      adapterId: 'samskara_ar',
      customAttributeFilters: {
        'orientation': 'portrait',
        'artist_name': {'like': '%John%'},
        'average_rating': {'gteq': '4.0'},
      },
      sortBy: 'view_count',
      sortOrder: 'DESC',
    );

    print('Found ${arProducts.items.length} AR products');

    for (final product in arProducts.items) {
      print('\n=== ${product.baseProduct.name} ===');

      if (product.customData != null) {
        final arData = product.customData!;
        print('Model: ${arData.modelPath}');
        print('Artist: ${arData.artistName}');
        print('Rating: ${arData.averageRating}/5.0');
        print('Views: ${arData.viewCount}');
        print('Valid AR Model: ${arData.isValidARModel}');
        print('Has Audio: ${arData.hasAudio}');
        print('Popularity Score: ${arData.popularityScore}');

        // Check validation
        if (product.isCustomDataValid) {
          print('✅ Data is valid');
        } else {
          print('❌ Validation errors: ${product.customDataValidationErrors}');
        }
      }
    }
  }

  /// Example: Working with fashion products
  static Future<void> fashionProductsExample() async {
    // Get eco-friendly fashion products on sale
    final fashionProducts = await _magento.enhancedProducts
        .searchByCustomAttributes<FashionAttributes>(
      customAttributeFilters: {
        'is_eco_friendly': 'true',
        'discount': {'gt': '0'},
        'gender': {
          'in': ['unisex', 'women']
        },
      },
      adapterId: 'fashion',
    );

    print(
        'Found ${fashionProducts.items.length} eco-friendly fashion products on sale');

    for (final product in fashionProducts.items) {
      print('\n=== ${product.baseProduct.name} ===');

      if (product.customData != null) {
        final fashionData = product.customData!;
        print('Color: ${fashionData.color}');
        print('Size: ${fashionData.size}');
        print('Brand: ${fashionData.brand}');
        print('Discount: ${fashionData.discount}%');
        print('Eco-friendly: ${fashionData.isEcoFriendly}');
        print('Premium: ${fashionData.isPremium}');

        if (fashionData.hasDiscount && fashionData.originalPrice != null) {
          print('Original: \$${fashionData.originalPrice}');
          print('Sale price: \$${fashionData.discountedPrice}');
        }
      }
    }
  }

  /// Example: Auto-detection and mixed products
  static Future<void> mixedProductsExample() async {
    // Get products and let system auto-detect appropriate adapters
    final products =
        await _magento.enhancedProducts.getProductsWithMultipleAdapters();

    print('Processing ${products.items.length} products with auto-detection');

    for (final product in products.items) {
      print('\n--- ${product.baseProduct.name} ---');

      if (product.adapterId != null) {
        print('Detected adapter: ${product.adapterId}');

        // Handle different types of custom data
        switch (product.adapterId) {
          case 'samskara_ar':
            if (product.customData is ARAttributes) {
              final arData = product.customData as ARAttributes;
              print('AR Model: ${arData.isValidARModel ? 'Valid' : 'Invalid'}');
              print('Artist: ${arData.artistName ?? 'Unknown'}');
            }
            break;
          case 'fashion':
            if (product.customData is FashionAttributes) {
              final fashionData = product.customData as FashionAttributes;
              print('Fashion item: ${fashionData.color} ${fashionData.brand}');
              print('Sustainable: ${fashionData.isSustainable}');
            }
            break;
        }
      } else {
        print('No suitable adapter found');
        print('Raw attributes: ${product.rawCustomAttributes.keys.join(', ')}');
      }
    }
  }

  /// Example: Creating and registering a custom adapter
  static void customAdapterExample() {
    // Register additional adapters at runtime
    _magento.registerCustomAttributesAdapter(
      'electronics',
      ElectronicsAdapter(), // Your custom adapter
      priority: 10,
    );

    // Check registration
    if (_magento.isCustomAttributesAdapterRegistered('electronics')) {
      print('Electronics adapter registered successfully');
    }

    // Get statistics
    final stats = _magento.customAttributesStatistics;
    print('Total adapters: ${stats['totalAdapters']}');
    print('Mapped attributes: ${stats['totalMappedAttributes']}');
  }
}

/// Example of a custom adapter for electronics products
class ElectronicsAdapter
    extends CustomAttributesAdapter<ElectronicsAttributes> {
  @override
  String get adapterId => 'electronics';

  @override
  List<String> get supportedAttributeCodes => [
        'brand',
        'model',
        'warranty_years',
        'energy_rating',
        'power_consumption',
        'dimensions',
        'weight',
      ];

  @override
  ElectronicsAttributes fromCustomAttributes(List<CustomAttribute> attributes) {
    final attrMap = {
      for (var attr in attributes) attr.attributeCode: attr.value
    };

    return ElectronicsAttributes(
      brand: attrMap['brand'],
      model: attrMap['model'],
      warrantyYears: int.tryParse(attrMap['warranty_years'] ?? ''),
      energyRating: attrMap['energy_rating'],
      powerConsumption: double.tryParse(attrMap['power_consumption'] ?? ''),
      dimensions: attrMap['dimensions'],
      weight: double.tryParse(attrMap['weight'] ?? ''),
    );
  }

  @override
  List<CustomAttribute> toCustomAttributes(ElectronicsAttributes model) {
    final attributes = <CustomAttribute>[];

    if (model.brand != null) {
      attributes
          .add(CustomAttribute(attributeCode: 'brand', value: model.brand!));
    }
    // ... add other attributes

    return attributes;
  }

  @override
  ValidationResult validate(ElectronicsAttributes model) {
    final errors = <String>[];

    if (model.warrantyYears != null && model.warrantyYears! < 0) {
      errors.add('Warranty years must be non-negative');
    }

    return ValidationResult(isValid: errors.isEmpty, errors: errors);
  }

  @override
  U? getAttributeValue<U>(List<CustomAttribute> attributes, String code) {
    // Implementation similar to other adapters
    return null;
  }

  @override
  Map<String, dynamic> buildSearchFilters(ElectronicsAttributes model) {
    final filters = <String, dynamic>{};

    if (model.brand != null) {
      filters['brand'] = model.brand;
    }

    return filters;
  }
}

/// Example electronics attributes model
class ElectronicsAttributes {
  final String? brand;
  final String? model;
  final int? warrantyYears;
  final String? energyRating;
  final double? powerConsumption;
  final String? dimensions;
  final double? weight;

  const ElectronicsAttributes({
    this.brand,
    this.model,
    this.warrantyYears,
    this.energyRating,
    this.powerConsumption,
    this.dimensions,
    this.weight,
  });
}
