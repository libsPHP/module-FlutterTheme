import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:example/main.dart';
import 'package:example/providers/app_provider.dart';

void main() {
  group('HomeScreen Tests', () {
    testWidgets('should display home screen with correct elements', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: MainScreen()),
        ),
      );

      // Wait for the widget to build
      await tester.pumpAndSettle();

      // Check if the home screen elements are present
      expect(find.text('Magento Flutter Demo'), findsOneWidget);
      expect(find.text('Status'), findsOneWidget);
      expect(find.text('Quick Actions'), findsOneWidget);
    });

    testWidgets('should display not configured state initially', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: MainScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Should show not configured state
      expect(find.text('Not Configured'), findsOneWidget);
      expect(find.text('Configure Magento API'), findsOneWidget);
    });

    testWidgets('should navigate to different tabs', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: MainScreen()),
        ),
      );

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
    });
  });
}
