import 'package:design_patterns_in_dart/creational/singleton.dart';
import 'package:test_api/test_api.dart';

void main() {
  test("should have access by global variable", () {
    expect(me, isNotNull);
    // Me._internal(); // not accessible
    // Me(); // no default constructor
  });
}
