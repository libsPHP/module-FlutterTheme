import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:example/providers/app_provider.dart';
import 'package:example/screens/config_screen.dart';

void main() {
  group('ConfigScreen Tests', () {
    testWidgets('should display config screen with correct elements', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: ConfigScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Check if config screen elements are present
      expect(find.text('Magento Configuration'), findsOneWidget);
      expect(find.text('API Base URL'), findsOneWidget);
      expect(find.text('Save Configuration'), findsOneWidget);
      expect(find.text('Initialize Magento'), findsOneWidget);
    });

    testWidgets('should display default API URL', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: ConfigScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Should show default API URL
      expect(find.text('https://luma-demo.scandipwa.com/'), findsOneWidget);
    });

    testWidgets('should handle URL input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: ConfigScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Enter new URL
      await tester.enterText(find.byType(TextField), 'https://example.com');
      await tester.pumpAndSettle();

      // Should show the new URL
      expect(find.text('https://example.com'), findsOneWidget);
    });

    testWidgets('should handle save configuration', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: ConfigScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Tap save button
      await tester.tap(find.text('Save Configuration'));
      await tester.pumpAndSettle();

      // Should not throw any errors
      expect(tester.takeException(), isNull);
    });

    testWidgets('should handle initialize Magento', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: ConfigScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Tap initialize button
      await tester.tap(find.text('Initialize Magento'));
      await tester.pumpAndSettle();

      // Should not throw any errors
      expect(tester.takeException(), isNull);
    });

    testWidgets('should display sample URLs', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: ConfigScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Should show sample URLs
      expect(find.text('Sample URLs:'), findsOneWidget);
      expect(find.text('https://demo.magento.com'), findsOneWidget);
    });

    testWidgets('should display current status', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: ConfigScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Should show current status
      expect(find.text('Current Status:'), findsOneWidget);
      expect(find.text('Not Initialized'), findsOneWidget);
    });
  });
}
