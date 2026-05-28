import 'package:flutter/material.dart';

import 'magento_theme_data.dart';

/// Provides [MagentoThemeData] to descendant widgets.
class MagentoTheme extends InheritedWidget {
  /// The theme data.
  final MagentoThemeData data;

  const MagentoTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Gets the [MagentoThemeData] from the nearest ancestor [MagentoTheme].
  ///
  /// If no [MagentoTheme] is found, returns default theme data.
  static MagentoThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<MagentoTheme>();
    return theme?.data ?? MagentoThemeData.defaults();
  }

  /// Gets the [MagentoThemeData] without registering for rebuilds.
  static MagentoThemeData? maybeOf(BuildContext context) {
    final theme =
        context.getInheritedWidgetOfExactType<MagentoTheme>();
    return theme?.data;
  }

  @override
  bool updateShouldNotify(MagentoTheme oldWidget) => data != oldWidget.data;
}
