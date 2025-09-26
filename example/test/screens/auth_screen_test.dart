import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:example/providers/app_provider.dart';
import 'package:example/screens/auth_screen.dart';

void main() {
  group('AuthScreen Tests', () {
    testWidgets('should display login and register tabs', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: AuthScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Check if tabs are present
      expect(find.text('Login'), findsOneWidget);
      expect(find.text('Register'), findsOneWidget);
    });

    testWidgets('should display login form by default', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: AuthScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Check if login form elements are present
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('should switch to register tab', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: AuthScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Tap on register tab
      await tester.tap(find.text('Register'));
      await tester.pumpAndSettle();

      // Check if register form elements are present
      expect(find.text('First Name'), findsOneWidget);
      expect(find.text('Last Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Register'), findsOneWidget);
    });

    testWidgets('should validate email field', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: AuthScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Enter invalid email
      await tester.enterText(find.byType(TextFormField).first, 'invalid-email');
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Should show validation error
      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('should validate password field', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: AuthScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Enter short password
      await tester.enterText(find.byType(TextFormField).at(1), '123');
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Should show validation error
      expect(
        find.text('Password must be at least 6 characters'),
        findsOneWidget,
      );
    });

    testWidgets('should handle login with valid credentials', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: AuthScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Enter valid credentials
      await tester.enterText(
        find.byType(TextFormField).first,
        'test@example.com',
      );
      await tester.enterText(find.byType(TextFormField).at(1), 'password123');

      // Tap login button
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Should not show validation errors
      expect(find.text('Please enter a valid email'), findsNothing);
      expect(find.text('Password must be at least 6 characters'), findsNothing);
    });

    testWidgets('should handle registration with valid data', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
          child: const MaterialApp(home: AuthScreen()),
        ),
      );

      await tester.pumpAndSettle();

      // Switch to register tab
      await tester.tap(find.text('Register'));
      await tester.pumpAndSettle();

      // Enter valid registration data
      await tester.enterText(find.byType(TextFormField).first, 'John');
      await tester.enterText(find.byType(TextFormField).at(1), 'Doe');
      await tester.enterText(
        find.byType(TextFormField).at(2),
        'john@example.com',
      );
      await tester.enterText(find.byType(TextFormField).at(3), 'password123');

      // Tap register button
      await tester.tap(find.text('Register'));
      await tester.pumpAndSettle();

      // Should not show validation errors
      expect(find.text('Please enter your first name'), findsNothing);
      expect(find.text('Please enter your last name'), findsNothing);
      expect(find.text('Please enter a valid email'), findsNothing);
      expect(find.text('Password must be at least 6 characters'), findsNothing);
    });
  });
}
