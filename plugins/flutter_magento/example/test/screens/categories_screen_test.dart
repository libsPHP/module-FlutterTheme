import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:example/providers/app_provider.dart';
import 'package:example/screens/categories_screen.dart';

void main() {
  group('CategoriesScreen Tests', () {
    testWidgets('should display categories screen with correct elements', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: CategoriesScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Check if categories screen elements are present
      expect(find.text('Categories'), findsOneWidget);
    });

    testWidgets('should display not configured state initially', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: CategoriesScreen()),
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

    testWidgets('should display refresh button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: CategoriesScreen()),
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
          child: const MaterialApp(home: CategoriesScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Tap refresh button
      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      // Should not throw any errors
      expect(tester.takeException(), isNull);
    });

    testWidgets('should display empty state when no categories', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: CategoriesScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Should show empty state
      expect(find.text('No categories available'), findsOneWidget);
      expect(
        find.text('Categories will appear here once they are loaded'),
        findsOneWidget,
      );
    });
  });
}
