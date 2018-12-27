import 'package:design_patterns_in_dart/structural/flyweight.dart';
import 'package:test_api/test_api.dart';

void main() {
  setUp(() {
    Vector3.flyweights.clear();
  });

  test("should have empty flyweights list initially", () {
    expect(Vector3.flyweights, equals([]));
  });

  test("should not create duplicate vectors", () {
    final a = Vector3();
    final b = Vector3(x: 1, y: 1, z: 1);
    Vector3(x: 1, y: 1, z: 1);

    expect(Vector3.flyweights.length, equals(2));
    expect(Vector3.flyweights, containsAllInOrder([a, b]));
  });
}
