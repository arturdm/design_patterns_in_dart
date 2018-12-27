import 'package:design_patterns_in_dart/structural/proxy.dart';
import 'package:test_api/test_api.dart';

void main() {
  Set<int> mutableSet;
  Set<int> unmodifiableSet;

  setUp(() {
    mutableSet = Set.of([1, 2, 3]);
    unmodifiableSet = UnmodifiableSet.unmodifiable(mutableSet);
  });

  test("should contain value", () {
    expect(unmodifiableSet.contains(1), isTrue);
  });

  test("should calculate difference", () {
    expect(unmodifiableSet.difference(Set.of([2, 3, 4])), equals(Set.of([1])));
  });

  test("should throw when adding", () {
    expect(() => unmodifiableSet.add(4), throwsUnsupportedError);
  });

  test("should throw when clearing", () {
    expect(() => unmodifiableSet.clear(), throwsUnsupportedError);
  });
}
