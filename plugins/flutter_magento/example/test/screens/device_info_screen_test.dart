import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:example/screens/device_info_screen.dart';

void main() {
  group('DeviceInfoScreen Tests', () {
    testWidgets('should display device info screen with tabs', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: DeviceInfoScreen()));

      await tester.pumpAndSettle();

      // Check if device info screen elements are present
      expect(find.text('Device Information'), findsOneWidget);
      expect(find.text('Fingerprint'), findsOneWidget);
      expect(find.text('Performance'), findsOneWidget);
      expect(find.text('Optimization'), findsOneWidget);
      expect(find.text('Analytics'), findsOneWidget);
    });

    testWidgets('should display fingerprint tab by default', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: DeviceInfoScreen()));

      await tester.pumpAndSettle();

      // Should show fingerprint content
      expect(find.text('Device Fingerprint'), findsOneWidget);
    });

    testWidgets('should switch between tabs', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: DeviceInfoScreen()));

      await tester.pumpAndSettle();

      // Switch to performance tab
      await tester.tap(find.text('Performance'));
      await tester.pumpAndSettle();
      expect(find.text('Performance Category'), findsOneWidget);

      // Switch to optimization tab
      await tester.tap(find.text('Optimization'));
      await tester.pumpAndSettle();
      expect(find.text('Optimization Settings'), findsOneWidget);

      // Switch to analytics tab
      await tester.tap(find.text('Analytics'));
      await tester.pumpAndSettle();
      expect(find.text('Analytics Data'), findsOneWidget);
    });

    testWidgets('should display loading state initially', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: DeviceInfoScreen()));

      await tester.pumpAndSettle();

      // Should show loading indicator
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display refresh button', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: DeviceInfoScreen()));

      await tester.pumpAndSettle();

      // Check if refresh button is present
      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });

    testWidgets('should handle refresh action', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: DeviceInfoScreen()));

      await tester.pumpAndSettle();

      // Tap refresh button
      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      // Should not throw any errors
      expect(tester.takeException(), isNull);
    });
  });
}
