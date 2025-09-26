import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:example/providers/app_provider.dart';
import 'package:example/screens/products_screen.dart';

void main() {
  group('ProductsScreen Tests', () {
    testWidgets('should display products screen with search bar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: ProductsScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Check if search bar is present
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Search products...'), findsOneWidget);
    });

    testWidgets('should display not configured state initially', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: ProductsScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Should show not configured state
      expect(find.text('Magento not configured'), findsOneWidget);
      expect(
        find.text('Please configure Magento API in the Config tab first'),
        findsOneWidget,
      );
    });

    testWidgets('should handle search input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: ProductsScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Enter search query
      await tester.enterText(find.byType(TextField), 'test product');
      await tester.pumpAndSettle();

      // Should show the search query in the field
      expect(find.text('test product'), findsOneWidget);
    });

    testWidgets('should display refresh button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: ProductsScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Check if refresh button is present
      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });

    testWidgets('should handle refresh action', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: ProductsScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Tap refresh button
      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      // Should not throw any errors
      expect(tester.takeException(), isNull);
    });

    testWidgets('should display empty state when no products', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: ProductsScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Should show empty state
      expect(find.text('No products available'), findsOneWidget);
      expect(
        find.text('Products will appear here once they are loaded'),
        findsOneWidget,
      );
    });
  });
}
