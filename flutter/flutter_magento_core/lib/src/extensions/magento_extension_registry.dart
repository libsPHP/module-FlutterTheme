/// Registry for Magento SDK extensions.
///
/// Allows custom modules and features to be registered
/// and accessed throughout the SDK.
///
/// Example:
/// ```dart
/// final registry = MagentoExtensionRegistry();
/// registry.register(MarketplaceExtension());
/// registry.register(LoyaltyPointsExtension());
///
/// // Later, access the extension
/// final marketplace = registry.get<MarketplaceExtension>();
/// final points = registry.maybeGet<LoyaltyPointsExtension>();
/// ```
class MagentoExtensionRegistry {
  final Map<Type, Object> _extensions = {};

  /// Registers an extension.
  ///
  /// Throws if an extension of the same type is already registered.
  void register<T extends Object>(T extension) {
    if (_extensions.containsKey(T)) {
      throw StateError(
        'Extension of type $T is already registered. '
        'Use replace() to override.',
      );
    }
    _extensions[T] = extension;
  }

  /// Replaces an existing extension or registers a new one.
  void replace<T extends Object>(T extension) {
    _extensions[T] = extension;
  }

  /// Gets a registered extension.
  ///
  /// Throws if the extension is not registered.
  T get<T extends Object>() {
    final extension = _extensions[T];
    if (extension == null) {
      throw StateError(
        'Extension of type $T is not registered. '
        'Register it using registry.register().',
      );
    }
    return extension as T;
  }

  /// Gets a registered extension or null if not registered.
  T? maybeGet<T extends Object>() {
    return _extensions[T] as T?;
  }

  /// Checks if an extension is registered.
  bool has<T extends Object>() {
    return _extensions.containsKey(T);
  }

  /// Removes a registered extension.
  void unregister<T extends Object>() {
    _extensions.remove(T);
  }

  /// Clears all registered extensions.
  void clear() {
    _extensions.clear();
  }

  /// Returns all registered extension types.
  Iterable<Type> get registeredTypes => _extensions.keys;
}
