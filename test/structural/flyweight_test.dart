import 'package:meta/meta.dart';
import 'package:test/test.dart';

class Vector3 {
  static final List<Vector3> _flyweights = [];

  final double x;
  final double y;
  final double z;

  factory Vector3({double x = 0, double y = 0, double z = 0}) {
    return _flyweights.firstWhere(
      (vector3) => vector3.x == x && vector3.y == y && vector3.z == z,
      orElse: () {
        final flyweight = Vector3._internal(x, y, z);
        _flyweights.add(flyweight);
        return flyweight;
      },
    );
  }

  const Vector3._internal(double this.x, double this.y, double this.z);

  @visibleForTesting
  static List<Vector3> get flyweights => _flyweights;

  @override
  String toString() => "Vector3($x, $y, $z)";
}

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
