import 'package:flutter/foundation.dart';
import '../models/product_models.dart';
import 'custom_attributes_adapter.dart';
import 'validation_result.dart';

/// Manager for registering and managing custom attributes adapters.
///
/// This singleton class manages the registration and coordination of custom
/// attribute adapters in the universal custom attributes system. It provides
/// adapter discovery, priority management, and attribute-to-adapter mapping.
///
/// ## Features
///
/// - **Adapter Registration**: Register custom attribute adapters with priority
/// - **Attribute Mapping**: Automatic mapping of attributes to appropriate adapters
/// - **Priority Management**: Handle adapter conflicts using priority system
/// - **Adapter Discovery**: Find suitable adapters for specific attributes
/// - **Debug Support**: Comprehensive debug logging for adapter operations
/// - **State Management**: Reactive state updates through ChangeNotifier
/// - **Validation**: Validate adapters and their configurations
///
/// ## Usage
///
/// ```dart
/// final manager = CustomAttributesManager.instance;
///
/// // Enable debug logging
/// manager.enableDebugLogging = true;
///
/// // Register custom adapter
/// manager.registerAdapter<MyProductModel>(
///   'my_adapter',
///   MyCustomAdapter(),
///   priority: 10,
/// );
///
/// // Find adapter for attributes
/// final adapter = manager.findAdapterForAttributes(attributes);
/// ```
class CustomAttributesManager extends ChangeNotifier {
  static final CustomAttributesManager _instance = CustomAttributesManager._();
  static CustomAttributesManager get instance => _instance;
  CustomAttributesManager._();

  final Map<String, CustomAttributesAdapter> _adapters = {};
  final Map<String, String> _attributeToAdapterMap = {};
  final Map<String, int> _adapterPriority = {};

  bool _debugLogging = false;

  /// Enable or disable debug logging
  set enableDebugLogging(bool enabled) {
    _debugLogging = enabled;
  }

  /// Register adapter for specific product type
  void registerAdapter<T>(
    String adapterId,
    CustomAttributesAdapter<T> adapter, {
    int priority = 0,
  }) {
    if (_debugLogging) {
      debugPrint(
        'CustomAttributesManager: Registering adapter $adapterId with priority $priority',
      );
    }

    _adapters[adapterId] = adapter;
    _adapterPriority[adapterId] = priority;

    // Map attributes to adapter
    for (final attributeCode in adapter.supportedAttributeCodes) {
      final existingAdapterId = _attributeToAdapterMap[attributeCode];

      // Only override if new adapter has higher priority
      if (existingAdapterId == null ||
          (_adapterPriority[adapterId] ?? 0) >
              (_adapterPriority[existingAdapterId] ?? 0)) {
        _attributeToAdapterMap[attributeCode] = adapterId;

        if (_debugLogging && existingAdapterId != null) {
          debugPrint(
            'CustomAttributesManager: Attribute $attributeCode reassigned from $existingAdapterId to $adapterId',
          );
        }
      }
    }

    notifyListeners();
  }

  /// Unregister adapter
  void unregisterAdapter(String adapterId) {
    if (_debugLogging) {
      debugPrint('CustomAttributesManager: Unregistering adapter $adapterId');
    }

    final adapter = _adapters.remove(adapterId);
    _adapterPriority.remove(adapterId);

    if (adapter != null) {
      // Remove attribute mappings
      _attributeToAdapterMap.removeWhere((key, value) => value == adapterId);

      // Reassign attributes to other adapters if available
      _rebuildAttributeMapping();
    }

    notifyListeners();
  }

  /// Get adapter by ID
  CustomAttributesAdapter<T>? getAdapter<T>(String adapterId) {
    final adapter = _adapters[adapterId];
    if (adapter is CustomAttributesAdapter<T>) {
      return adapter;
    }

    if (_debugLogging && adapter != null) {
      debugPrint(
        'CustomAttributesManager: Type mismatch for adapter $adapterId',
      );
    }

    return null;
  }

  /// Automatic adapter detection by attributes
  CustomAttributesAdapter? detectAdapter(List<CustomAttribute> attributes) {
    if (attributes.isEmpty) return null;

    final attributeCodes = attributes.map((attr) => attr.attributeCode).toSet();

    // Find adapters that can handle these attributes
    final candidateAdapters = <String, int>{};

    for (final entry in _adapters.entries) {
      final adapterId = entry.key;
      final adapter = entry.value;

      if (adapter.canHandle(attributes)) {
        // Calculate score based on how many attributes this adapter supports
        final supportedCodes = adapter.supportedAttributeCodes.toSet();
        final matchingCodes = attributeCodes.intersection(supportedCodes);
        final score =
            matchingCodes.length * 100 + (_adapterPriority[adapterId] ?? 0);
        candidateAdapters[adapterId] = score;
      }
    }

    if (candidateAdapters.isEmpty) {
      if (_debugLogging) {
        debugPrint(
          'CustomAttributesManager: No suitable adapter found for attributes: $attributeCodes',
        );
      }
      return null;
    }

    // Return adapter with highest score
    final bestAdapterId = candidateAdapters.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;

    if (_debugLogging) {
      debugPrint(
        'CustomAttributesManager: Detected adapter $bestAdapterId for attributes: $attributeCodes',
      );
    }

    return _adapters[bestAdapterId];
  }

  /// Get adapter by attribute code
  CustomAttributesAdapter? getAdapterByAttribute(String attributeCode) {
    final adapterId = _attributeToAdapterMap[attributeCode];
    return adapterId != null ? _adapters[adapterId] : null;
  }

  /// Get all registered adapters
  Map<String, CustomAttributesAdapter> get registeredAdapters =>
      Map.unmodifiable(_adapters);

  /// Get adapter priorities
  Map<String, int> get adapterPriorities => Map.unmodifiable(_adapterPriority);

  /// Get attribute to adapter mapping
  Map<String, String> get attributeMapping =>
      Map.unmodifiable(_attributeToAdapterMap);

  /// Check if adapter is registered
  bool isAdapterRegistered(String adapterId) =>
      _adapters.containsKey(adapterId);

  /// Get adapter info
  Map<String, dynamic> getAdapterInfo(String adapterId) {
    final adapter = _adapters[adapterId];
    if (adapter == null) return {};

    return {
      'adapterId': adapterId,
      'version': adapter.version,
      'supportedAttributeCodes': adapter.supportedAttributeCodes,
      'priority': _adapterPriority[adapterId] ?? 0,
      'type': adapter.runtimeType.toString(),
    };
  }

  /// Get all adapters info
  List<Map<String, dynamic>> getAllAdaptersInfo() {
    return _adapters.keys
        .map((adapterId) => getAdapterInfo(adapterId))
        .toList();
  }

  /// Validate custom data using appropriate adapter
  ValidationResult? validateCustomData<T>(String adapterId, T data) {
    final adapter = getAdapter<T>(adapterId);
    return adapter?.validate(data);
  }

  /// Convert custom attributes using detected adapter
  T? convertCustomAttributes<T>(List<CustomAttribute> attributes) {
    final adapter = detectAdapter(attributes);
    if (adapter is CustomAttributesAdapter<T>) {
      return adapter.fromCustomAttributes(attributes);
    }
    return null;
  }

  /// Clear all adapters
  void clearAllAdapters() {
    if (_debugLogging) {
      debugPrint('CustomAttributesManager: Clearing all adapters');
    }

    _adapters.clear();
    _attributeToAdapterMap.clear();
    _adapterPriority.clear();

    notifyListeners();
  }

  /// Get statistics
  Map<String, dynamic> getStatistics() {
    final attributeCount = _attributeToAdapterMap.length;
    final adapterCount = _adapters.length;
    final averageAttributesPerAdapter = adapterCount > 0
        ? (attributeCount / adapterCount).toStringAsFixed(2)
        : '0';

    return {
      'totalAdapters': adapterCount,
      'totalMappedAttributes': attributeCount,
      'averageAttributesPerAdapter': averageAttributesPerAdapter,
      'adapterTypes': _adapters.values
          .map((a) => a.runtimeType.toString())
          .toSet()
          .toList(),
    };
  }

  /// Rebuild attribute mapping after adapter changes
  void _rebuildAttributeMapping() {
    _attributeToAdapterMap.clear();

    // Sort adapters by priority (highest first)
    final sortedAdapters = _adapters.entries.toList()
      ..sort(
        (a, b) => (_adapterPriority[b.key] ?? 0).compareTo(
          _adapterPriority[a.key] ?? 0,
        ),
      );

    for (final entry in sortedAdapters) {
      final adapterId = entry.key;
      final adapter = entry.value;

      for (final attributeCode in adapter.supportedAttributeCodes) {
        // Only assign if not already assigned (higher priority adapters go first)
        if (!_attributeToAdapterMap.containsKey(attributeCode)) {
          _attributeToAdapterMap[attributeCode] = adapterId;
        }
      }
    }

    if (_debugLogging) {
      debugPrint(
        'CustomAttributesManager: Rebuilt attribute mapping with ${_attributeToAdapterMap.length} attributes',
      );
    }
  }

  /// Dispose resources
  @override
  void dispose() {
    clearAllAdapters();
    super.dispose();
  }
}
