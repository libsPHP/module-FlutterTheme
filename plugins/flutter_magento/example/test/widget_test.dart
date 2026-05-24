import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';

void main() {
  group('Main App Tests', () {
    testWidgets('should build app without errors', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Should not throw any errors
      expect(tester.takeException(), isNull);
    });

    testWidgets('should display main screen with navigation', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Should show main screen elements
      expect(find.text('Magento Flutter Demo'), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Products'), findsOneWidget);
      expect(find.text('Cart'), findsOneWidget);
      expect(find.text('Categories'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('should navigate between tabs', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Test navigation to different tabs
      await tester.tap(find.text('Products'));
      await tester.pumpAndSettle();
      expect(find.text('Products'), findsOneWidget);

      await tester.tap(find.text('Cart'));
      await tester.pumpAndSettle();
      expect(find.text('Cart'), findsOneWidget);

      await tester.tap(find.text('Categories'));
      await tester.pumpAndSettle();
      expect(find.text('Categories'), findsOneWidget);

      await tester.tap(find.text('Settings'));
      await tester.pumpAndSettle();
      expect(find.text('Settings'), findsOneWidget);

      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('should handle app initialization', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Should initialize without errors
      expect(tester.takeException(), isNull);
    });

    testWidgets('should display bottom navigation bar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Should show bottom navigation bar
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });
  });
}
