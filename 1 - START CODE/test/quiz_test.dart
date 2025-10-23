import 'package:test/test.dart';

void main() {
  group('Basic Math Tests', () {
    test('My first test', () {
      // Arrange
      int x = 2 + 2;

      // Act (nothing special here, just simple addition)

      // Assert
      expect(x, equals(4));
    });
  });
}
