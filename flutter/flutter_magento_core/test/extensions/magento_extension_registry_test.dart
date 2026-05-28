import 'package:test/test.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';

// Test extension classes
class TestExtensionA {
  final String value;
  TestExtensionA(this.value);
}

class TestExtensionB {
  final int count;
  TestExtensionB(this.count);
}

void main() {
  group('MagentoExtensionRegistry', () {
    late MagentoExtensionRegistry registry;

    setUp(() {
      registry = MagentoExtensionRegistry();
    });

    group('register', () {
      test('registers an extension', () {
        final ext = TestExtensionA('test');
        registry.register(ext);

        expect(registry.has<TestExtensionA>(), true);
      });

      test('throws when registering duplicate type', () {
        registry.register(TestExtensionA('first'));

        expect(
          () => registry.register(TestExtensionA('second')),
          throwsA(isA<StateError>()),
        );
      });

      test('allows different types', () {
        registry.register(TestExtensionA('a'));
        registry.register(TestExtensionB(1));

        expect(registry.has<TestExtensionA>(), true);
        expect(registry.has<TestExtensionB>(), true);
      });
    });

    group('replace', () {
      test('replaces existing extension', () {
        registry.register(TestExtensionA('first'));
        registry.replace(TestExtensionA('second'));

        final ext = registry.get<TestExtensionA>();
        expect(ext.value, 'second');
      });

      test('registers new extension if not exists', () {
        registry.replace(TestExtensionA('new'));

        expect(registry.has<TestExtensionA>(), true);
        expect(registry.get<TestExtensionA>().value, 'new');
      });
    });

    group('get', () {
      test('returns registered extension', () {
        final original = TestExtensionA('test');
        registry.register(original);

        final retrieved = registry.get<TestExtensionA>();
        expect(retrieved, same(original));
      });

      test('throws when extension not registered', () {
        expect(
          () => registry.get<TestExtensionA>(),
          throwsA(isA<StateError>()),
        );
      });
    });

    group('maybeGet', () {
      test('returns registered extension', () {
        final original = TestExtensionA('test');
        registry.register(original);

        final retrieved = registry.maybeGet<TestExtensionA>();
        expect(retrieved, same(original));
      });

      test('returns null when extension not registered', () {
        final retrieved = registry.maybeGet<TestExtensionA>();
        expect(retrieved, isNull);
      });
    });

    group('has', () {
      test('returns true when registered', () {
        registry.register(TestExtensionA('test'));
        expect(registry.has<TestExtensionA>(), true);
      });

      test('returns false when not registered', () {
        expect(registry.has<TestExtensionA>(), false);
      });
    });

    group('unregister', () {
      test('removes registered extension', () {
        registry.register(TestExtensionA('test'));
        registry.unregister<TestExtensionA>();

        expect(registry.has<TestExtensionA>(), false);
      });

      test('does nothing for non-existent extension', () {
        // Should not throw
        registry.unregister<TestExtensionA>();
        expect(registry.has<TestExtensionA>(), false);
      });
    });

    group('clear', () {
      test('removes all extensions', () {
        registry.register(TestExtensionA('a'));
        registry.register(TestExtensionB(1));

        registry.clear();

        expect(registry.has<TestExtensionA>(), false);
        expect(registry.has<TestExtensionB>(), false);
      });
    });

    group('registeredTypes', () {
      test('returns empty for new registry', () {
        expect(registry.registeredTypes, isEmpty);
      });

      test('returns all registered types', () {
        registry.register(TestExtensionA('a'));
        registry.register(TestExtensionB(1));

        final types = registry.registeredTypes.toList();
        expect(types, containsAll([TestExtensionA, TestExtensionB]));
      });
    });
  });
}
